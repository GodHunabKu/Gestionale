/**
 * Shop AJAX Features: Gift System, Purchase History
 * @version 2.0.0 - Cleaned (Removed Quick View)
 */

class ShopAJAXFeatures {
    constructor() {
        // Usa path assoluto definito in js.php
        this.apiUrl = window.SHOP_API_URL || (window.SHOP_BASE_URL + 'api/shop_api.php');
        this.init();
    }

    init() {
        // Aspetta che il DOM sia completamente caricato
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', () => {
                this.setupGiftSystem();
                this.setupHistory();
            });
        } else {
            this.setupGiftSystem();
            this.setupHistory();
        }
    }

    // Gift System
    setupGiftSystem() {
        // Gift modal gestito da bottoni specifici
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
            window.Toast.error('Inserisci il nome del destinatario');
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
                window.Toast.success(data.message || 'Regalo inviato con successo!');
                $('#giftModal').modal('hide');
            } else {
                window.Toast.error(data.error || 'Errore invio regalo');
            }
        } catch (error) {
            window.Toast.error('Errore di rete');
            console.error('Gift error:', error);
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
                window.Toast.error('Errore caricamento storico');
            }
        } catch (error) {
            window.Toast.error('Errore di rete');
            console.error('History error:', error);
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
                <div class="modal-dialog modal-xl" style="z-index: 10500;">
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

// Inizializza quando il DOM è pronto
if (typeof window.ShopAJAX === 'undefined') {
    window.ShopAJAX = new ShopAJAXFeatures();
}
