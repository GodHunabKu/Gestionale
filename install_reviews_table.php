<?php
/**
 * Script per creare la tabella item_reviews nel database SQLite
 * Eseguire UNA SOLA VOLTA
 */

require_once 'include/functions/config.php';
require_once 'include/classes/user.php';

$database = new USER($host, $user, $password);

try {
    // Crea tabella item_reviews
    $sql = "CREATE TABLE IF NOT EXISTS item_reviews (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        item_id INTEGER NOT NULL,
        account_login VARCHAR(30) NOT NULL,
        rating INTEGER NOT NULL CHECK(rating >= 1 AND rating <= 5),
        review_text TEXT,
        created_at DATETIME NOT NULL,
        UNIQUE(item_id, account_login)
    )";

    $database->execQuerySqlite($sql);

    echo "✅ Tabella 'item_reviews' creata con successo!<br>";
    echo "✅ Puoi eliminare questo file install_reviews_table.php<br>";

} catch (Exception $e) {
    echo "❌ Errore: " . $e->getMessage();
}
?>
