/**
 * Shopping Cart System
 * Sistema carrello laterale con localStorage
 * @version 1.0.0
 */

class ShoppingCart {
    constructor() {
        this.cart = this.loadCart();
        this.init();
    }

    init() {
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', () => this.setup());
        } else {
            this.setup();
        }
    }

    setup() {
        this.renderCartButton();
        this.setupAddToCartButtons();
        this.updateCartBadge();
    }

    // Carica carrello da localStorage
    loadCart() {
        const saved = localStorage.getItem('shop_cart');
        return saved ? JSON.parse(saved) : [];
    }

    // Salva carrello in localStorage
    saveCart() {
        localStorage.setItem('shop_cart', JSON.stringify(this.cart));
        this.updateCartBadge();
    }

    // Aggiungi item al carrello
    addItem(item) {
        // Verifica se l'item esiste già
        const existingIndex = this.cart.findIndex(i => i.id === item.id);

        if (existingIndex >= 0) {
            // Aumenta quantità
            this.cart[existingIndex].quantity += 1;
            window.Toast.success(`${item.name} x${this.cart[existingIndex].quantity}`);
        } else {
            // Aggiungi nuovo item
            this.cart.push({
                id: item.id,
                vnum: item.vnum,
                name: item.name,
                price: item.price,
                discount: item.discount || 0,
                quantity: 1
            });
            window.Toast.success(`${item.name} aggiunto al carrello`);
        }

        this.saveCart();
        return true;
    }

    // Rimuovi item dal carrello
    removeItem(itemId) {
        const index = this.cart.findIndex(i => i.id === itemId);
        if (index >= 0) {
            const item = this.cart[index];
            this.cart.splice(index, 1);
            this.saveCart();
            window.Toast.info(`${item.name} rimosso dal carrello`);
            this.renderCartSidebar(); // Ricarica sidebar
        }
    }

    // Aggiorna quantità item
    updateQuantity(itemId, quantity) {
        const item = this.cart.find(i => i.id === itemId);
        if (item) {
            item.quantity = Math.max(1, parseInt(quantity));
            this.saveCart();
            this.renderCartSidebar();
        }
    }

    // Svuota carrello
    clearCart() {
        this.cart = [];
        this.saveCart();
        window.Toast.info('Carrello svuotato');
        this.renderCartSidebar();
    }

    // Calcola totale
    getTotal() {
        return this.cart.reduce((total, item) => {
            const price = item.discount > 0
                ? item.price - (item.price * item.discount / 100)
                : item.price;
            return total + (price * item.quantity);
        }, 0);
    }

    // Conta item nel carrello
    getItemCount() {
        return this.cart.reduce((count, item) => count + item.quantity, 0);
    }

    // Aggiorna badge carrello
    updateCartBadge() {
        const badge = document.getElementById('cart-badge');
        const count = this.getItemCount();
        if (badge) {
            badge.textContent = count;
            badge.style.display = count > 0 ? 'inline-block' : 'none';
        }
    }

    // Renderizza bottone carrello in header
    renderCartButton() {
        const targetNav = document.querySelector('.nav-menu');
        if (!targetNav || document.getElementById('btn-show-cart')) return;

        const cartButton = `
            <li class="nav-item" id="cart-nav-item">
                <a href="#" class="nav-link" id="btn-show-cart">
                    <i class="fa fa-shopping-cart"></i>
                    <span>Carrello <span id="cart-badge" class="badge badge-danger" style="display:none;">0</span></span>
                </a>
            </li>
        `;

        // Inserisci prima del bottone storico
        const historiBtn = document.getElementById('btn-show-history');
        if (historiBtn && historiBtn.parentElement) {
            historiBtn.parentElement.insertAdjacentHTML('beforebegin', cartButton);
        } else {
            targetNav.insertAdjacentHTML('beforeend', cartButton);
        }

        // Event listener per aprire carrello
        document.getElementById('btn-show-cart').addEventListener('click', (e) => {
            e.preventDefault();
            this.toggleCartSidebar();
        });

        this.updateCartBadge();
    }

    // Setup bottoni "Aggiungi al carrello"
    setupAddToCartButtons() {
        document.addEventListener('click', (e) => {
            const addBtn = e.target.closest('.btn-add-to-cart');
            if (addBtn) {
                e.preventDefault();

                const item = {
                    id: parseInt(addBtn.dataset.itemId),
                    vnum: parseInt(addBtn.dataset.itemVnum),
                    name: addBtn.dataset.itemName,
                    price: parseInt(addBtn.dataset.itemPrice),
                    discount: parseInt(addBtn.dataset.itemDiscount) || 0
                };

                this.addItem(item);
            }
        });
    }

    // Toggle sidebar carrello
    toggleCartSidebar() {
        let sidebar = document.getElementById('cart-sidebar');

        if (sidebar) {
            sidebar.classList.toggle('active');
        } else {
            this.renderCartSidebar();
        }
    }

    // Renderizza sidebar carrello
    renderCartSidebar() {
        let sidebar = document.getElementById('cart-sidebar');

        // Rimuovi sidebar esistente
        if (sidebar) {
            sidebar.remove();
        }

        const total = this.getTotal();
        const itemsHTML = this.cart.length === 0
            ? '<div class="cart-empty"><i class="fa fa-shopping-cart fa-3x"></i><p>Carrello vuoto</p></div>'
            : this.cart.map(item => {
                const itemPrice = item.discount > 0
                    ? item.price - (item.price * item.discount / 100)
                    : item.price;

                return `
                    <div class="cart-item">
                        <div class="cart-item-info">
                            <strong>${item.name}</strong>
                            <small>vnum: ${item.vnum}</small>
                            ${item.discount > 0 ? `<span class="badge badge-danger">-${item.discount}%</span>` : ''}
                        </div>
                        <div class="cart-item-controls">
                            <input type="number"
                                   min="1"
                                   value="${item.quantity}"
                                   class="cart-quantity"
                                   data-item-id="${item.id}">
                            <span class="cart-item-price">${itemPrice * item.quantity} MD</span>
                            <button class="btn-remove-cart" data-item-id="${item.id}">
                                <i class="fa fa-times"></i>
                            </button>
                        </div>
                    </div>
                `;
            }).join('');

        const sidebarHTML = `
            <div id="cart-sidebar" class="cart-sidebar active">
                <div class="cart-header">
                    <h3><i class="fa fa-shopping-cart"></i> Carrello</h3>
                    <button id="close-cart" class="close-cart"><i class="fa fa-times"></i></button>
                </div>
                <div class="cart-body">
                    ${itemsHTML}
                </div>
                <div class="cart-footer">
                    <div class="cart-total">
                        <strong>Totale:</strong>
                        <span class="total-amount">${total} MD</span>
                    </div>
                    ${this.cart.length > 0 ? `
                        <button id="clear-cart" class="btn btn-sm btn-secondary btn-block mb-2">
                            <i class="fa fa-trash"></i> Svuota Carrello
                        </button>
                        <button id="checkout-cart" class="btn btn-success btn-block">
                            <i class="fa fa-check"></i> Procedi all'acquisto
                        </button>
                    ` : ''}
                </div>
            </div>
            <div id="cart-overlay" class="cart-overlay active"></div>
        `;

        document.body.insertAdjacentHTML('beforeend', sidebarHTML);

        // Event listeners
        document.getElementById('close-cart').addEventListener('click', () => this.toggleCartSidebar());
        document.getElementById('cart-overlay').addEventListener('click', () => this.toggleCartSidebar());

        if (this.cart.length > 0) {
            // Rimuovi item
            document.querySelectorAll('.btn-remove-cart').forEach(btn => {
                btn.addEventListener('click', (e) => {
                    const itemId = parseInt(e.currentTarget.dataset.itemId);
                    this.removeItem(itemId);
                });
            });

            // Aggiorna quantità
            document.querySelectorAll('.cart-quantity').forEach(input => {
                input.addEventListener('change', (e) => {
                    const itemId = parseInt(e.target.dataset.itemId);
                    const quantity = parseInt(e.target.value);
                    this.updateQuantity(itemId, quantity);
                });
            });

            // Svuota carrello
            document.getElementById('clear-cart').addEventListener('click', () => {
                if (confirm('Vuoi svuotare il carrello?')) {
                    this.clearCart();
                }
            });

            // Checkout
            document.getElementById('checkout-cart').addEventListener('click', () => {
                this.checkout();
            });
        }
    }

    // Checkout - acquista tutti gli item
    async checkout() {
        if (this.cart.length === 0) {
            window.Toast.error('Carrello vuoto');
            return;
        }

        const total = this.getTotal();
        const itemsList = this.cart.map(i => `${i.name} x${i.quantity}`).join(', ');

        if (!confirm(`Confermi l'acquisto di:\n\n${itemsList}\n\nTotale: ${total} MD`)) {
            return;
        }

        // Acquista ogni item
        let success = true;
        for (const item of this.cart) {
            // Redirect alla pagina di acquisto per ogni item
            // In questo modo utilizziamo il sistema esistente
            const url = `${window.SHOP_BASE_URL}buy/${item.id}`;

            // Per ora mostriamo un messaggio
            window.Toast.info(`Reindirizzamento per acquisto: ${item.name}`);
        }

        if (success) {
            // Nota: in un sistema reale faresti una chiamata AJAX per acquistare tutto in una volta
            window.Toast.warning('Usa il bottone "Compra" su ogni item per completare l\'acquisto');
            this.toggleCartSidebar();
        }
    }
}

// Inizializza carrello
window.Cart = new ShoppingCart();
