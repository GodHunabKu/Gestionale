<?php
/**
 * Installazione Tabella item_reviews
 * Esegui questo script una sola volta per creare la tabella delle recensioni
 * 
 * Uso: php install_reviews_table.php
 */

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/include/classes/user.php';

echo "=================================================\n";
echo "   INSTALLAZIONE TABELLA ITEM_REVIEWS\n";
echo "=================================================\n\n";

try {
    $database = new USER($host, $user, $password);

    // Verifica se la tabella esiste già
    $check = $database->runQuerySqlite("SELECT name FROM sqlite_master WHERE type='table' AND name='item_reviews'");
    $exists = $check->fetch();

    if($exists) {
        echo "⚠️  ATTENZIONE: La tabella 'item_reviews' esiste già!\n";
        echo "✓ Nessuna azione necessaria.\n\n";
        exit(0);
    }

    // Crea tabella
    $sql = "CREATE TABLE item_reviews (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        item_id INTEGER NOT NULL,
        account_login TEXT NOT NULL,
        rating INTEGER NOT NULL CHECK(rating >= 1 AND rating <= 5),
        review_text TEXT,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        UNIQUE(item_id, account_login)
    )";

    $database->runQuerySqlite($sql);
    echo "✓ Tabella 'item_reviews' creata\n";

    // Crea indici
    $database->runQuerySqlite("CREATE INDEX idx_reviews_item_id ON item_reviews(item_id)");
    echo "✓ Indice 'idx_reviews_item_id' creato\n";

    $database->runQuerySqlite("CREATE INDEX idx_reviews_account ON item_reviews(account_login)");
    echo "✓ Indice 'idx_reviews_account' creato\n";

    $database->runQuerySqlite("CREATE INDEX idx_reviews_rating ON item_reviews(rating)");
    echo "✓ Indice 'idx_reviews_rating' creato\n";

    $database->runQuerySqlite("CREATE INDEX idx_reviews_created ON item_reviews(created_at DESC)");
    echo "✓ Indice 'idx_reviews_created' creato\n";

    echo "\n=================================================\n";
    echo "✅ INSTALLAZIONE COMPLETATA CON SUCCESSO!\n";
    echo "=================================================\n\n";
    echo "La tabella 'item_reviews' è ora pronta per l'uso.\n";
    echo "Gli utenti potranno lasciare recensioni sugli item acquistati.\n\n";

} catch (Exception $e) {
    echo "\n=================================================\n";
    echo "❌ ERRORE DURANTE L'INSTALLAZIONE\n";
    echo "=================================================\n\n";
    echo "Messaggio errore: " . $e->getMessage() . "\n\n";
    exit(1);
}
?>
