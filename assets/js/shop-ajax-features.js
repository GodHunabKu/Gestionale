/**
 * Shop AJAX Features: Quick View, Gift System, History
 * @version 1.0.0
 */

class ShopAJAXFeatures {
    constructor() {
        // Usa path assoluto definito in js.php
        this.apiUrl = window.SHOP_API_URL || '/api/shop_api.php';
        this.init();
    }

    init() {
        // Aspetta che il DOM sia completamente caricato
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', () => {
                this.setupQuickView();
                this.setupGiftSystem();
                this.setupHistory();
            });
        } else {
            this.setupQuickView();
            this.setupGiftSystem();
            this.setupHistory();
        }
    }

    // Quick View Modal
    setupQuickView() {
        document.addEventListener('click', (e) => {
            const quickViewBtn = e.target.closest('.btn-quick-view');
            if (quickViewBtn) {
                e.preventDefault();
                const itemId = quickViewBtn.dataset.itemId;
                this.showQuickView(itemId);
            }
        });
    }

    async showQuickView(itemId) {
        try {
            const response = await fetch(this.apiUrl, {
                method: 'POST',
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                body: `action=quick_view&item_id=${itemId}`
            });

            const data = await response.json();

            if (data.success) {
                this.renderQuickViewModal(data.item);
            } else {
                Toast.error(data.error || 'Errore caricamento item');
            }
        } catch (error) {
            Toast.error('Errore di rete');
        }
    }

    renderQuickViewModal(item) {
        const finalPrice = item.discount > 0 ?
            item.coins - (item.coins * item.discount / 100) : item.coins;

        let bonusesHTML = '';
        if (item.bonuses && item.bonuses.length > 0) {
            bonusesHTML = '<div class="quick-view-bonuses"><h5>Bonus:</h5>';
            item.bonuses.forEach(bonus => {
                bonusesHTML += `<div class="bonus-item-small"><i class="fa fa-check"></i> ${bonus.name}: ${bonus.formatted_value}</div>`;
            });
            bonusesHTML += '</div>';
        }

        const modalHTML = `
            <div class="modal fade" id="quickViewModal" tabindex="-1">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">${item.name}</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-4 text-center">
                                    <img src="images/items/${item.vnum}.png" class="img-fluid" style="max-width: 150px;">
                                    <div class="mt-3">
                                        ${item.rating.total > 0 ? `
                                            <div class="rating-stars-small">
                                                ${'<i class="fa fa-star"></i>'.repeat(Math.round(item.rating.average))}
                                                ${'<i class="fa fa-star-o"></i>'.repeat(5 - Math.round(item.rating.average))}
                                            </div>
                                            <small>${item.rating.average}/5 (${item.rating.total} reviews)</small>
                                        ` : ''}
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <p><strong>Categoria:</strong> ${item.category}</p>
                                    ${item.description ? `<p>${item.description}</p>` : ''}
                                    ${bonusesHTML}
                                    <div class="price-section mt-3">
                                        ${item.discount > 0 ? `
                                            <del>${item.coins} MD</del>
                                            <span class="badge badge-danger">-${item.discount}%</span><br>
                                        ` : ''}
                                        <h3 class="text-success">${Math.round(finalPrice)} MD</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="item/${item.id}/" class="btn btn-primary">Vedi Dettagli</a>
                            <button type="button" class="btn btn-success" onclick="ShopAJAX.showGiftModal(${item.id})">
                                <i class="fa fa-gift"></i> Regala
                            </button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
                        </div>
                    </div>
                </div>
            </div>
        `;

        // Rimuovi modal esistente
        const existing = document.getElementById('quickViewModal');
        if (existing) existing.remove();

        document.body.insertAdjacentHTML('beforeend', modalHTML);
        $('#quickViewModal').modal('show');
    }

    // Gift System
    setupGiftSystem() {
        // Gift modal già gestito dal quick view
    }

    showGiftModal(itemId) {
        const modalHTML = `
            <div class="modal fade" id="giftModal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header bg-primary">
                            <h4 class="modal-title"><i class="fa fa-gift"></i> Regala Item</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form id="giftForm">
                                <div class="form-group">
                                    <label>Nome Giocatore:</label>
                                    <input type="text" class="form-control" id="giftRecipient" required placeholder="Inserisci nome account">
                                </div>
                                <div class="form-group">
                                    <label>Messaggio (opzionale):</label>
                                    <textarea class="form-control" id="giftMessage" rows="3" maxlength="100" placeholder="Aggiungi un messaggio..."></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" onclick="ShopAJAX.sendGift(${itemId})">
                                <i class="fa fa-paper-plane"></i> Invia Regalo
                            </button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Annulla</button>
                        </div>
                    </div>
                </div>
            </div>
        `;

        const existing = document.getElementById('giftModal');
        if (existing) existing.remove();

        document.body.insertAdjacentHTML('beforeend', modalHTML);
        $('#giftModal').modal('show');
    }

    async sendGift(itemId) {
        const recipient = document.getElementById('giftRecipient').value.trim();
        const message = document.getElementById('giftMessage').value.trim();

        if (!recipient) {
            Toast.warning('Inserisci il nome del destinatario');
            return;
        }

        try {
            const response = await fetch(this.apiUrl, {
                method: 'POST',
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                body: `action=send_gift&item_id=${itemId}&recipient=${encodeURIComponent(recipient)}&message=${encodeURIComponent(message)}`
            });

            const data = await response.json();

            if (data.success) {
                Toast.success(data.message);
                $('#giftModal').modal('hide');
                $('#quickViewModal').modal('hide');
                setTimeout(() => location.reload(), 2000);
            } else {
                Toast.error(data.error);
            }
        } catch (error) {
            Toast.error('Errore invio regalo');
        }
    }

    // Purchase History
    setupHistory() {
        // Supporta sia showHistoryBtn che btn-show-history
        const historyBtn = document.getElementById('showHistoryBtn') || document.getElementById('btn-show-history');
        if (historyBtn) {
            historyBtn.addEventListener('click', (e) => {
                e.preventDefault();
                this.showHistory();
            });
        }
    }

    async showHistory() {
        try {
            const response = await fetch(this.apiUrl, {
                method: 'POST',
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                body: 'action=get_history&limit=50'
            });

            const data = await response.json();

            if (data.success) {
                this.renderHistoryModal(data.history);
            } else {
                Toast.error('Errore caricamento storico');
            }
        } catch (error) {
            Toast.error('Errore di rete');
        }
    }

    renderHistoryModal(history) {
        let historyHTML = '';

        if (history.length === 0) {
            historyHTML = '<div class="alert alert-info">Nessun acquisto effettuato</div>';
        } else {
            history.forEach(item => {
                const takenStatus = item.taken_time ?
                    '<span class="badge badge-success">Ritirato</span>' :
                    '<span class="badge badge-warning">Da ritirare</span>';

                historyHTML += `
                    <tr>
                        <td>${item.id}</td>
                        <td><strong>${item.item_name || 'Item #' + item.vnum}</strong><br><small class="text-muted">vnum: ${item.vnum}</small></td>
                        <td>${item.count}x</td>
                        <td>${item.given_time}</td>
                        <td>${takenStatus}</td>
                        <td><small>${item.why || '-'}</small></td>
                    </tr>
                `;
            });
        }

        const modalHTML = `
            <div class="modal fade" id="historyModal" tabindex="-1">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header bg-info">
                            <h4 class="modal-title"><i class="fa fa-history"></i> Storico Acquisti</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body" style="max-height: 500px; overflow-y: auto;">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Item</th>
                                        <th>Qta</th>
                                        <th>Data</th>
                                        <th>Stato</th>
                                        <th>Note</th>
                                    </tr>
                                </thead>
                                <tbody>${historyHTML}</tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
                        </div>
                    </div>
                </div>
            </div>
        `;

        const existing = document.getElementById('historyModal');
        if (existing) existing.remove();

        document.body.insertAdjacentHTML('beforeend', modalHTML);
        $('#historyModal').modal('show');
    }
}

// Inizializza
window.ShopAJAX = new ShopAJAXFeatures();
