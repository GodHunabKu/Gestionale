<?php
/**
 * Setup Reviews Table
 * Esegui questo script tramite browser o curl per creare la tabella item_reviews
 */

// Disable output buffering
if (ob_get_level()) ob_end_clean();
header('Content-Type: text/plain; charset=utf-8');

echo "=================================================\n";
echo "   SETUP TABELLA ITEM_REVIEWS\n";
echo "=================================================\n\n";

try {
    // Carica configurazione
    require_once __DIR__ . '/config.php';
    require_once __DIR__ . '/include/classes/user.php';
    
    $database = new USER($host, $user, $password);
    
    // Verifica se la tabella esiste
    $check = $database->runQuerySqlite("SELECT name FROM sqlite_master WHERE type='table' AND name='item_reviews'");
    $exists = $check->fetch();
    
    if($exists) {
        echo "✓ La tabella 'item_reviews' esiste già!\n";
        echo "✓ Nessuna azione necessaria.\n\n";
    } else {
        // Crea tabella
        $database->runQuerySqlite("CREATE TABLE item_reviews (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            item_id INTEGER NOT NULL,
            account_login TEXT NOT NULL,
            rating INTEGER NOT NULL CHECK(rating >= 1 AND rating <= 5),
            review_text TEXT,
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
            UNIQUE(item_id, account_login)
        )");
        echo "✓ Tabella 'item_reviews' creata\n";
        
        // Crea indici
        $database->runQuerySqlite("CREATE INDEX idx_reviews_item_id ON item_reviews(item_id)");
        $database->runQuerySqlite("CREATE INDEX idx_reviews_account ON item_reviews(account_login)");
        $database->runQuerySqlite("CREATE INDEX idx_reviews_rating ON item_reviews(rating)");
        $database->runQuerySqlite("CREATE INDEX idx_reviews_created ON item_reviews(created_at DESC)");
        echo "✓ Indici creati (4)\n";
        
        echo "\n✅ INSTALLAZIONE COMPLETATA!\n";
    }
    
    // Verifica finale
    $count = $database->runQuerySqlite("SELECT COUNT(*) as total FROM item_reviews")->fetch();
    echo "\nStatistiche:\n";
    echo "- Recensioni presenti: " . $count['total'] . "\n";
    
    echo "\n=================================================\n";
    echo "Sistema recensioni pronto all'uso!\n";
    echo "=================================================\n";
    
} catch (Exception $e) {
    echo "\n❌ ERRORE: " . $e->getMessage() . "\n\n";
    echo "Traccia:\n" . $e->getTraceAsString() . "\n";
}
?>
