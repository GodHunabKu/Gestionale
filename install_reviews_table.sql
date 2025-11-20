-- ============================================
-- ITEM REVIEWS TABLE
-- Tabella per il sistema di recensioni degli item
-- ============================================

CREATE TABLE IF NOT EXISTS item_reviews (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    item_id INTEGER NOT NULL,
    account_login TEXT NOT NULL,
    rating INTEGER NOT NULL CHECK(rating >= 1 AND rating <= 5),
    review_text TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(item_id, account_login)
);

-- Indici per performance
CREATE INDEX IF NOT EXISTS idx_reviews_item_id ON item_reviews(item_id);
CREATE INDEX IF NOT EXISTS idx_reviews_account ON item_reviews(account_login);
CREATE INDEX IF NOT EXISTS idx_reviews_rating ON item_reviews(rating);
CREATE INDEX IF NOT EXISTS idx_reviews_created ON item_reviews(created_at DESC);
