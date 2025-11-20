# 🔧 Installazione Sistema Recensioni

## ⚠️ IMPORTANTE: Tabella `item_reviews` Mancante

Il sistema recensioni richiede la tabella `item_reviews` nel database SQLite.

---

## 📋 Metodo 1: Installazione tramite Browser (CONSIGLIATO)

1. **Apri il browser** e vai a:
   ```
   https://tuosito.com/shop2/CREATE_REVIEWS_TABLE.php
   ```

2. **Lo script creerà automaticamente**:
   - Tabella `item_reviews`
   - 4 indici per ottimizzazione
   - Verifica dello stato

3. **Elimina il file** dopo l'installazione:
   ```bash
   rm CREATE_REVIEWS_TABLE.php
   ```

---

## 📋 Metodo 2: Installazione Manuale (SQL)

Se hai accesso SSH e sqlite3:

```bash
cd /home/oneshyra/public_html/shop2
sqlite3 include/db/site.db < install_reviews_table.sql
```

---

## 🗄️ Struttura Tabella

```sql
CREATE TABLE item_reviews (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    item_id INTEGER NOT NULL,
    account_login TEXT NOT NULL,
    rating INTEGER NOT NULL CHECK(rating >= 1 AND rating <= 5),
    review_text TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(item_id, account_login)
);

-- 4 Indici per performance
CREATE INDEX idx_reviews_item_id ON item_reviews(item_id);
CREATE INDEX idx_reviews_account ON item_reviews(account_login);
CREATE INDEX idx_reviews_rating ON item_reviews(rating);
CREATE INDEX idx_reviews_created ON item_reviews(created_at DESC);
```

---

## ✅ Verifica Installazione

Dopo l'installazione, gli errori:
```
Error in has_reviewed_item: no such table: item_reviews
Error in get_item_average_rating: no such table: item_reviews
Error in get_item_reviews: no such table: item_reviews
```

...dovrebbero sparire dai log.

---

## 🎯 Caratteristiche Sistema Recensioni

- ✅ **Solo acquirenti** possono recensire (verifica tramite `item_award`)
- ✅ **Una recensione per utente** per item (UNIQUE constraint)
- ✅ **Rating 1-5 stelle** obbligatorio
- ✅ **Testo recensione** opzionale
- ✅ **Timestamp automatico** alla creazione
- ✅ **Media rating** calcolata dinamicamente
- ✅ **Display pubblico** di tutte le recensioni

---

## 🔒 Sicurezza

- Tutti i file di setup (`.php` e `.sql`) possono essere eliminati dopo l'installazione
- Le funzioni di recensione hanno protezione SQL injection (PDO prepared statements)
- Validazione rating 1-5 a livello database (CHECK constraint)

---

## 📝 Note

- Il sistema è già integrato in `pages/shop/item.php`
- Le funzioni sono in `include/functions/basic.php`
- CSS styling in `assets/css/shop-features-2025.css`
