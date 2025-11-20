<?php
/**
 * SCRIPT DI INSTALLAZIONE TABELLA REVIEWS
 * Esegui questo file tramite browser: https://tuosito.com/shop2/CREATE_REVIEWS_TABLE.php
 */

error_reporting(E_ALL);
ini_set('display_errors', 1);
header('Content-Type: text/html; charset=utf-8');
?>
<!DOCTYPE html>
<html>
<head>
    <title>Installazione Tabella Reviews</title>
    <style>
        body { font-family: monospace; background: #1a1a1a; color: #00ff00; padding: 20px; }
        .success { color: #00ff00; }
        .error { color: #ff0000; }
        .warning { color: #ffaa00; }
        pre { background: #000; padding: 15px; border-radius: 5px; }
    </style>
</head>
<body>
<pre>
<?php
echo "=================================================\n";
echo "   INSTALLAZIONE TABELLA ITEM_REVIEWS\n";
echo "=================================================\n\n";

try {
    // Connessione diretta al database SQLite
    $db_path = __DIR__ . '/include/db/site.db';
    
    if(!file_exists($db_path)) {
        throw new Exception("Database non trovato: " . $db_path);
    }
    
    $db = new PDO('sqlite:' . $db_path);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    echo "<span class='success'>✓ Connessione al database riuscita</span>\n";
    echo "  Percorso: " . $db_path . "\n\n";
    
    // Verifica se la tabella esiste
    $result = $db->query("SELECT name FROM sqlite_master WHERE type='table' AND name='item_reviews'");
    $exists = $result->fetch();
    
    if($exists) {
        echo "<span class='warning'>⚠ La tabella 'item_reviews' esiste già!</span>\n\n";
        
        // Mostra statistiche
        $count = $db->query("SELECT COUNT(*) as total FROM item_reviews")->fetch();
        echo "Statistiche:\n";
        echo "- Recensioni presenti: " . $count['total'] . "\n\n";
        
        echo "<span class='success'>✓ Nessuna azione necessaria.</span>\n";
    } else {
        echo "Creazione tabella 'item_reviews'...\n";
        
        // Crea tabella
        $db->exec("CREATE TABLE item_reviews (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            item_id INTEGER NOT NULL,
            account_login TEXT NOT NULL,
            rating INTEGER NOT NULL CHECK(rating >= 1 AND rating <= 5),
            review_text TEXT,
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
            UNIQUE(item_id, account_login)
        )");
        echo "<span class='success'>✓ Tabella creata</span>\n\n";
        
        // Crea indici
        echo "Creazione indici...\n";
        $db->exec("CREATE INDEX idx_reviews_item_id ON item_reviews(item_id)");
        echo "<span class='success'>✓ idx_reviews_item_id</span>\n";
        
        $db->exec("CREATE INDEX idx_reviews_account ON item_reviews(account_login)");
        echo "<span class='success'>✓ idx_reviews_account</span>\n";
        
        $db->exec("CREATE INDEX idx_reviews_rating ON item_reviews(rating)");
        echo "<span class='success'>✓ idx_reviews_rating</span>\n";
        
        $db->exec("CREATE INDEX idx_reviews_created ON item_reviews(created_at DESC)");
        echo "<span class='success'>✓ idx_reviews_created</span>\n\n";
        
        echo "=================================================\n";
        echo "<span class='success'>✅ INSTALLAZIONE COMPLETATA CON SUCCESSO!</span>\n";
        echo "=================================================\n\n";
        echo "La tabella 'item_reviews' è ora attiva.\n";
        echo "Gli utenti possono lasciare recensioni sugli item.\n\n";
    }
    
    // Verifica finale
    $tables = $db->query("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name")->fetchAll(PDO::FETCH_COLUMN);
    echo "\nTabelle presenti nel database (" . count($tables) . "):\n";
    foreach($tables as $table) {
        echo "  - " . $table . "\n";
    }
    
} catch (Exception $e) {
    echo "<span class='error'>\n";
    echo "=================================================\n";
    echo "❌ ERRORE DURANTE L'INSTALLAZIONE\n";
    echo "=================================================\n\n";
    echo "Messaggio: " . $e->getMessage() . "\n\n";
    echo "Traccia:\n" . $e->getTraceAsString() . "\n";
    echo "</span>";
}

echo "\n\n<span class='warning'>IMPORTANTE: Elimina questo file dopo l'installazione per sicurezza!</span>\n";
?>
</pre>
</body>
</html>
