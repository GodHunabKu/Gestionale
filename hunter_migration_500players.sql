-- ============================================================
-- HUNTER LEVEL SYSTEM - MIGRATION FOR 500+ CONCURRENT PLAYERS
-- Run this SQL file to optimize the database for high concurrency
-- ============================================================

-- 1. REMOVE DUPLICATE COLUMN (current_rank is redundant with hunter_rank)
ALTER TABLE srv1_hunabku.hunter_quest_ranking DROP COLUMN IF EXISTS current_rank;

-- 2. ADD MISSING INDEXES FOR PERFORMANCE
-- Index for penalty checks (frequently queried)
ALTER TABLE srv1_hunabku.hunter_quest_ranking
ADD INDEX IF NOT EXISTS idx_penalty_active (penalty_active, penalty_expires);

-- Index for daily/weekly reset queries
ALTER TABLE srv1_hunabku.hunter_quest_ranking
ADD INDEX IF NOT EXISTS idx_last_activity (last_activity);

-- Index for mission queries by date
ALTER TABLE srv1_hunabku.hunter_player_missions
ADD INDEX IF NOT EXISTS idx_mission_date_status (assigned_date, status);

-- Index for player missions lookup
ALTER TABLE srv1_hunabku.hunter_player_missions
ADD INDEX IF NOT EXISTS idx_mission_player_date (player_id, assigned_date);

-- Index for trial expiration checks
ALTER TABLE srv1_hunabku.hunter_player_trials
ADD INDEX IF NOT EXISTS idx_trial_status_expires (status, expires_at);

-- Index for gate access queries
ALTER TABLE srv1_hunabku.hunter_gate_access
ADD INDEX IF NOT EXISTS idx_gate_status_expires (status, expires_at);

-- Index for achievements lookup
ALTER TABLE srv1_hunabku.hunter_achievements_claimed
ADD INDEX IF NOT EXISTS idx_ach_player (player_id);

-- 3. CREATE LOGGING STORED PROCEDURE (for security monitoring)
DROP PROCEDURE IF EXISTS srv1_hunabku.sp_hunter_log;

DELIMITER //
CREATE PROCEDURE srv1_hunabku.sp_hunter_log(
    IN p_player_id INT,
    IN p_player_name VARCHAR(24),
    IN p_log_type VARCHAR(20),
    IN p_severity VARCHAR(10),
    IN p_action VARCHAR(50),
    IN p_details TEXT,
    IN p_map_index INT,
    IN p_x INT,
    IN p_y INT
)
BEGIN
    -- Insert log with timestamp
    INSERT INTO srv1_hunabku.hunter_security_logs
        (player_id, player_name, log_type, severity, action, details, map_index, pos_x, pos_y, created_at)
    VALUES
        (p_player_id, p_player_name, p_log_type, p_severity, p_action, p_details, p_map_index, p_x, p_y, NOW());

    -- Auto-cleanup old logs (keep 7 days for INFO, 30 days for others)
    DELETE FROM srv1_hunabku.hunter_security_logs
    WHERE severity = 'INFO' AND created_at < DATE_SUB(NOW(), INTERVAL 7 DAY);

    DELETE FROM srv1_hunabku.hunter_security_logs
    WHERE severity != 'INFO' AND created_at < DATE_SUB(NOW(), INTERVAL 30 DAY);
END //
DELIMITER ;

-- 4. CREATE SECURITY LOGS TABLE IF NOT EXISTS
CREATE TABLE IF NOT EXISTS srv1_hunabku.hunter_security_logs (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    player_name VARCHAR(24),
    log_type VARCHAR(20) NOT NULL,
    severity VARCHAR(10) NOT NULL DEFAULT 'INFO',
    action VARCHAR(50),
    details TEXT,
    map_index INT DEFAULT 0,
    pos_x INT DEFAULT 0,
    pos_y INT DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_log_player (player_id),
    INDEX idx_log_type (log_type),
    INDEX idx_log_severity (severity),
    INDEX idx_log_created (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. ADD EXPIRES_AT COLUMN TO TRIALS IF MISSING
ALTER TABLE srv1_hunabku.hunter_player_trials
ADD COLUMN IF NOT EXISTS expires_at DATETIME DEFAULT NULL AFTER started_at;

-- 6. CREATE SCHEDULED EVENT FOR TRIAL EXPIRATION CHECK
-- Note: Requires EVENT scheduler to be enabled: SET GLOBAL event_scheduler = ON;
DROP EVENT IF EXISTS srv1_hunabku.evt_check_trial_expiration;

DELIMITER //
CREATE EVENT IF NOT EXISTS srv1_hunabku.evt_check_trial_expiration
ON SCHEDULE EVERY 5 MINUTE
DO
BEGIN
    -- Mark expired trials as failed
    UPDATE srv1_hunabku.hunter_player_trials
    SET status = 'failed'
    WHERE status = 'in_progress'
    AND expires_at IS NOT NULL
    AND expires_at < NOW();

    -- Clear expired penalties
    UPDATE srv1_hunabku.hunter_quest_ranking
    SET penalty_active = 0
    WHERE penalty_active = 1
    AND penalty_expires < UNIX_TIMESTAMP();
END //
DELIMITER ;

-- 7. CREATE SCHEDULED EVENT FOR DAILY CLEANUP
DROP EVENT IF EXISTS srv1_hunabku.evt_daily_cleanup;

DELIMITER //
CREATE EVENT IF NOT EXISTS srv1_hunabku.evt_daily_cleanup
ON SCHEDULE EVERY 1 DAY
STARTS TIMESTAMP(CURRENT_DATE, '00:05:00')
DO
BEGIN
    -- Cleanup old security logs
    DELETE FROM srv1_hunabku.hunter_security_logs
    WHERE created_at < DATE_SUB(NOW(), INTERVAL 30 DAY);

    -- Cleanup old gate access records
    DELETE FROM srv1_hunabku.hunter_gate_access
    WHERE status IN ('expired', 'completed', 'failed')
    AND updated_at < DATE_SUB(NOW(), INTERVAL 7 DAY);

    -- Cleanup old mission records (keep 30 days)
    DELETE FROM srv1_hunabku.hunter_player_missions
    WHERE assigned_date < DATE_SUB(CURDATE(), INTERVAL 30 DAY);

    -- Cleanup old stats snapshots
    DELETE FROM srv1_hunabku.hunter_player_stats_snapshot
    WHERE created_at < DATE_SUB(NOW(), INTERVAL 7 DAY);
END //
DELIMITER ;

-- 8. OPTIMIZE EXISTING TABLES
OPTIMIZE TABLE srv1_hunabku.hunter_quest_ranking;
OPTIMIZE TABLE srv1_hunabku.hunter_player_missions;
OPTIMIZE TABLE srv1_hunabku.hunter_player_trials;

-- 9. ADD NEW TRANSLATIONS FOR PENALTY SYSTEM
INSERT INTO srv1_hunabku.hunter_translations (translation_key, language, translation_value) VALUES
('PENALTY_ACTIVE', 'it', 'Penalita'' Attiva'),
('PENALTY_ACTIVE', 'en', 'Active Penalty'),
('PENALTY_ACTIVE', 'de', 'Aktive Strafe'),
('PENALTY_ACTIVE', 'es', 'Penalizacion Activa'),
('PENALTY_ACTIVE', 'fr', 'Penalite Active'),
('PENALTY_ACTIVE', 'pt', 'Penalidade Ativa'),
('PENALTY_ACTIVE', 'pl', 'Aktywna Kara'),
('PENALTY_ACTIVE', 'ru', 'Aktivnyy Shtraf'),
('CHEST_BUSY', 'it', 'Qualcuno sta gia'' aprendo questo baule!'),
('CHEST_BUSY', 'en', 'Someone is already opening this chest!'),
('CHEST_BUSY', 'de', 'Jemand offnet bereits diese Truhe!'),
('CHEST_BUSY', 'es', 'Alguien ya esta abriendo este cofre!'),
('CHEST_BUSY', 'fr', 'Quelqu''un ouvre deja ce coffre!'),
('CHEST_BUSY', 'pt', 'Alguem ja esta abrindo este bau!'),
('CHEST_BUSY', 'pl', 'Ktos juz otwiera ta skrzynie!'),
('CHEST_BUSY', 'ru', 'Kto-to uzhe otkryvayet etot sunduk!'),
('CHEST_ALREADY_OPENED', 'it', 'Questo baule e'' gia'' stato aperto!'),
('CHEST_ALREADY_OPENED', 'en', 'This chest has already been opened!'),
('CHEST_ALREADY_OPENED', 'de', 'Diese Truhe wurde bereits geoffnet!'),
('CHEST_ALREADY_OPENED', 'es', 'Este cofre ya ha sido abierto!'),
('CHEST_ALREADY_OPENED', 'fr', 'Ce coffre a deja ete ouvert!'),
('CHEST_ALREADY_OPENED', 'pt', 'Este bau ja foi aberto!'),
('CHEST_ALREADY_OPENED', 'pl', 'Ta skrzynia zostala juz otwarta!'),
('CHEST_ALREADY_OPENED', 'ru', 'Etot sunduk uzhe byl otkryt!'),
('SHOP_BUSY', 'it', 'Acquisto in corso, riprova.'),
('SHOP_BUSY', 'en', 'Purchase in progress, please retry.'),
('SHOP_BUSY', 'de', 'Kauf lauft, bitte erneut versuchen.'),
('SHOP_BUSY', 'es', 'Compra en curso, intenta de nuevo.'),
('SHOP_BUSY', 'fr', 'Achat en cours, reessayez.'),
('SHOP_BUSY', 'pt', 'Compra em andamento, tente novamente.'),
('SHOP_BUSY', 'pl', 'Zakup w toku, sprobuj ponownie.'),
('SHOP_BUSY', 'ru', 'Pokupka v processe, povtorite popytku.'),
('SHOP_ERROR', 'it', 'Errore durante l''acquisto.'),
('SHOP_ERROR', 'en', 'Error during purchase.'),
('SHOP_ERROR', 'de', 'Fehler beim Kauf.'),
('SHOP_ERROR', 'es', 'Error durante la compra.'),
('SHOP_ERROR', 'fr', 'Erreur lors de l''achat.'),
('SHOP_ERROR', 'pt', 'Erro durante a compra.'),
('SHOP_ERROR', 'pl', 'Blad podczas zakupu.'),
('SHOP_ERROR', 'ru', 'Oshibka pri pokupke.')
ON DUPLICATE KEY UPDATE translation_value = VALUES(translation_value);

-- 10. VERIFY INDEXES CREATED
SELECT
    TABLE_NAME,
    INDEX_NAME,
    COLUMN_NAME
FROM information_schema.STATISTICS
WHERE TABLE_SCHEMA = 'srv1_hunabku'
AND TABLE_NAME LIKE 'hunter_%'
ORDER BY TABLE_NAME, INDEX_NAME;

-- ============================================================
-- END OF MIGRATION
-- Run with: mysql -u root -p < hunter_migration_500players.sql
-- ============================================================
