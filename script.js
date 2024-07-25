document.addEventListener('DOMContentLoaded', function() {
    // Elementi DOM
    const form = document.getElementById('operationForm');
    const macchina = document.getElementById('macchina');
    const modulo = document.getElementById('modulo');
    const tipoOperazione = document.getElementById('tipoOperazione');
    const posizioneMola = document.getElementById('posizioneMola');
    const latoBisello = document.getElementById('latoBisello');
    const dettagliMola = document.getElementById('dettagliMola');
    const dettagliBisello = document.getElementById('dettagliBisello');
    const notificationBox = document.getElementById('notificationBox');
    const ultimeMoleContent = document.getElementById('ultimeMoleContent');

    // Operatori autorizzati
    const operatori = {
        "1234": "Mario Rossi",
        "5678": "Luigi Verdi",
        "9012": "Anna Bianchi"
    };

    // Dati simulati
    let tutteLeUltimeMole = [
        { data: '2024-07-24', macchina: 'Rettifica 1', posizione: 5, tipo: 'Tecnodiamant', operatore: 'Mario Rossi' },
        { data: '2024-07-23', macchina: 'Rettifica 2', posizione: 12, tipo: 'Surface', operatore: 'Luigi Verdi' },
        { data: '2024-07-22', macchina: 'Rettifica 0', posizione: 8, tipo: 'Tecnodiamant', operatore: 'Anna Bianchi' },
        { data: '2024-07-21', macchina: 'Rettifica 3', posizione: 18, tipo: 'Surface', operatore: 'Mario Rossi' },
        { data: '2024-07-20', macchina: 'Rettifica 1', posizione: 3, tipo: 'Tecnodiamant', operatore: 'Luigi Verdi' },
        { data: '2024-07-19', macchina: 'Rettifica 4', posizione: 22, tipo: 'Surface', operatore: 'Anna Bianchi' },
        { data: '2024-07-18', macchina: 'Rettifica 2', posizione: 15, tipo: 'Tecnodiamant', operatore: 'Mario Rossi' },
        { data: '2024-07-17', macchina: 'Rettifica 5', posizione: 7, tipo: 'Surface', operatore: 'Luigi Verdi' },
        { data: '2024-07-16', macchina: 'Rettifica 0', posizione: 10, tipo: 'Tecnodiamant', operatore: 'Anna Bianchi' },
        { data: '2024-07-15', macchina: 'Rettifica 3', posizione: 20, tipo: 'Surface', operatore: 'Mario Rossi' }
    ];

    // Funzioni di utilità
    function updateSelect(selectElement, options) {
        selectElement.innerHTML = '<option value="">Seleziona</option>' +
            options.map(option => `<option value="${option}">${option}</option>`).join('');
    }

    function showNotification(message, type) {
        notificationBox.textContent = message;
        notificationBox.className = `notification ${type}`;
        notificationBox.style.display = 'block';
        setTimeout(() => notificationBox.style.display = 'none', 3000);
    }

    // Funzioni di aggiornamento UI
    function updatePosizioneMola() {
        const maxPosition = modulo.value === 'primoModulo' ? 24 : 22;
        updateSelect(posizioneMola, Array.from({length: maxPosition}, (_, i) => i + 1));
    }

    function toggleDetailsVisibility() {
        dettagliMola.style.display = tipoOperazione.value === 'cambioMola' ? 'block' : 'none';
        dettagliBisello.style.display = tipoOperazione.value === 'cambioBisello' ? 'block' : 'none';
    }

    function populateUltimeMole(macchinaSelezionata = '') {
        const filteredMole = macchinaSelezionata
            ? tutteLeUltimeMole.filter(mola => mola.macchina === macchinaSelezionata)
            : tutteLeUltimeMole;

        const ultimeMole = filteredMole.slice(0, 10);

        if (ultimeMole.length === 0) {
            ultimeMoleContent.innerHTML = '<p>Nessun dato disponibile al momento.</p>';
            return;
        }

        const tableRows = ultimeMole.map(mola => `
            <tr>
                <td>${mola.data}</td>
                <td>${mola.macchina}</td>
                <td>${mola.posizione}</td>
                <td>${mola.tipo}</td>
                <td>${mola.operatore}</td>
            </tr>
        `).join('');

        ultimeMoleContent.innerHTML = `
            <table>
                <thead>
                    <tr>
                        <th>Data</th>
                        <th>Macchina</th>
                        <th>Posizione</th>
                        <th>Tipo</th>
                        <th>Operatore</th>
                    </tr>
                </thead>
                <tbody>${tableRows}</tbody>
            </table>
        `;
    }

    // Event listeners
    modulo.addEventListener('change', updatePosizioneMola);
    
    tipoOperazione.addEventListener('change', () => {
        toggleDetailsVisibility();
        if (tipoOperazione.value === 'cambioMola') updatePosizioneMola();
    });

    macchina.addEventListener('change', () => populateUltimeMole(macchina.value));

    form.addEventListener('submit', function(e) {
        e.preventDefault();
        const pin = document.getElementById('pin').value;

        if (!pin) {
            showNotification('Inserire il PIN.', 'error');
            return;
        }

        const operatore = operatori[pin];

        if (!operatore) {
            showNotification('PIN non valido. Operazione non registrata.', 'error');
            return;
        }

        // Verifica che tutti i campi obbligatori siano compilati
        if (!macchina.value || !tipoOperazione.value || !modulo.value) {
            showNotification('Compilare tutti i campi obbligatori.', 'error');
            return;
        }

        let posizione = 'N/A';
        let tipo = '';

        if (tipoOperazione.value === 'cambioMola') {
            if (!posizioneMola.value || !document.getElementById('tipoMola').value) {
                showNotification('Compilare tutti i dettagli per il cambio mola.', 'error');
                return;
            }
            posizione = posizioneMola.value;
            tipo = document.getElementById('tipoMola').value;
        } else if (tipoOperazione.value === 'cambioBisello') {
            if (!document.getElementById('latoBisello').value) {
                showNotification('Selezionare il lato del bisello.', 'error');
                return;
            }
            tipo = `Bisello ${document.getElementById('latoBisello').value}`;
        }

        const nuovaOperazione = {
            data: new Date().toISOString().split('T')[0],
            macchina: macchina.value,
            posizione: posizione,
            tipo: tipo,
            operatore: operatore
        };

        tutteLeUltimeMole.unshift(nuovaOperazione);
        showNotification('Operazione registrata con successo!', 'success');
        populateUltimeMole(macchina.value);

        form.reset();
        toggleDetailsVisibility();
    });

    // Inizializzazione
    populateUltimeMole();
});