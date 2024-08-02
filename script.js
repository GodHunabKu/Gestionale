document.addEventListener('DOMContentLoaded', function() {
    const pinInput = document.getElementById('pin');
    const turnoSelect = document.getElementById('turno');
    const macchinaSelect = document.getElementById('macchina');
    const tipoOperazioneSelect = document.getElementById('tipoOperazione');
    const moduloSelect = document.getElementById('modulo');
    const posizioneMolaSelect = document.getElementById('posizioneMola');
    const tipoMolaSelect = document.getElementById('tipoMola');
    const tipoSpecificoMolaSelect = document.getElementById('tipoSpecificoMola');
    const latoBiselloSelect = document.getElementById('latoBisello');
    const fornitoreBiselloSelect = document.getElementById('fornitoreBisello');
    const dettagliMola = document.getElementById('dettagliMola');
    const dettagliBisello = document.getElementById('dettagliBisello');
    const form = document.getElementById('operationForm');
    const notificationBox = document.getElementById('notificationBox');
    const ultimeMoleContent = document.getElementById('ultimeMoleContent');

    const operatori = {
        1234: 'Sthembari Rinor',
        4321: 'Lajaji Amine',
        9876: 'Villani Mattia'
    };

    const tipiMola = {
        'Surface': ['RK0 Benny 1', 'RK0 Benny 2', 'RK2 Benny 3', 'Saetta 1', 'Saetta 2'],
        'Tecnodiamant': ['TD0', 'TD1', 'TD2', 'MM0', 'MM1']
    };

    function getTurnoCorrente() {
        const now = new Date();
        const hour = now.getHours();
        if (hour >= 4 && hour < 12) {
            return 'Mattino';
        } else if (hour >= 12 && hour < 20) {
            return 'Pomeriggio';
        } else {
            return 'Notte';
        }
    }

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

    function updatePosizioneMola() {
        const maxPosition = moduloSelect.value === 'primoModulo' ? 24 : 22;
        updateSelect(posizioneMolaSelect, Array.from({length: maxPosition}, (_, i) => i + 1));
    }

    function updateTipiMola() {
        const fornitore = tipoMolaSelect.value;
        const tipi = tipiMola[fornitore] || [];
        updateSelect(tipoSpecificoMolaSelect, tipi);
    }

    function toggleDetailsVisibility() {
        const isCambioMola = tipoOperazioneSelect.value === 'cambioMola';
        const isCambioBisello = tipoOperazioneSelect.value === 'cambioBisello';
        
        dettagliMola.style.display = isCambioMola ? 'block' : 'none';
        dettagliBisello.style.display = isCambioBisello ? 'block' : 'none';
        
        posizioneMolaSelect.required = isCambioMola;
        tipoMolaSelect.required = isCambioMola;
        tipoSpecificoMolaSelect.required = isCambioMola;
        
        latoBiselloSelect.required = isCambioBisello;
        fornitoreBiselloSelect.required = isCambioBisello;
        
        if (isCambioMola) {
            updatePosizioneMola();
            updateTipiMola();
        }
    }

    function populateUltimeMole(operazioni) {
        if (!Array.isArray(operazioni) || operazioni.length === 0) {
            ultimeMoleContent.innerHTML = '<p>Nessun dato disponibile al momento.</p>';
            return;
        }

        const tableRows = operazioni.map(op => `
            <tr>
                <td>${new Date(op.data).toLocaleString()}</td>
                <td>${op.macchina}</td>
                <td>${op.posizione}</td>
                <td>${op.tipo}</td>
                <td>${op.tipoSpecifico}</td>
                <td>${op.operatore}</td>
                <td>${op.turno}</td>
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
                        <th>Tipo Specifico</th>
                        <th>Operatore</th>
                        <th>Turno</th>
                    </tr>
                </thead>
                <tbody>${tableRows}</tbody>
            </table>
        `;
    }

    function inviaOperazione(nuovaOperazione) {
        console.log('Dati inviati al server:', nuovaOperazione); // Log per verificare i dati
        fetch('http://localhost:3000/registra-operazione', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(nuovaOperazione)
        })
        .then(response => {
            if (!response.ok) {
                return response.json().then(error => { 
                    console.error('Errore restituito dal server:', error);
                    throw new Error(error.message); 
                });
            }
            return response.json();
        })
        .then(result => {
            showNotification('Operazione registrata con successo!', 'success');
            getUltimeOperazioni();
        })
        .catch(error => {
            console.error('Errore durante la registrazione dell\'operazione:', error);
            showNotification('Errore durante la registrazione dell\'operazione', 'error');
        });
    }

    function getUltimeOperazioni() {
        fetch('http://localhost:3000/ultime-operazioni')
            .then(response => response.json())
            .then(data => {
                console.log('Dati ricevuti dal server:', data);
                populateUltimeMole(data);
            })
            .catch(error => {
                console.error('Errore nel recupero delle ultime operazioni:', error);
                showNotification('Errore nel recupero delle ultime operazioni', 'error');
            });
    }

    moduloSelect.addEventListener('change', updatePosizioneMola);
    tipoMolaSelect.addEventListener('change', updateTipiMola);
    tipoOperazioneSelect.addEventListener('change', toggleDetailsVisibility);
    macchinaSelect.addEventListener('change', () => populateUltimeMole(macchinaSelect.value));

    form.addEventListener('submit', function(e) {
        e.preventDefault();
        const pin = pinInput.value;
        if (!pin) {
            showNotification('Inserire il PIN.', 'error');
            return;
        }
        const operatore = operatori[pin];
        if (!operatore) {
            showNotification('PIN non valido. Operazione non registrata.', 'error');
            return;
        }
        if (!macchinaSelect.value || !tipoOperazioneSelect.value || !moduloSelect.value || !turnoSelect.value) {
            showNotification('Compilare tutti i campi obbligatori.', 'error');
            return;
        }
        
        let posizione = null;
        let tipo = tipoOperazioneSelect.value;
        let tipoSpecifico = '';

        if (tipo === 'cambioMola') {
            if (!posizioneMolaSelect.value || !tipoMolaSelect.value || !tipoSpecificoMolaSelect.value) {
                showNotification('Compilare tutti i campi per il cambio mola.', 'error');
                return;
            }
            posizione = posizioneMolaSelect.value;
            tipoSpecifico = tipoSpecificoMolaSelect.value;
        } else if (tipo === 'cambioBisello') {
            if (!latoBiselloSelect.value || !fornitoreBiselloSelect.value) {
                showNotification('Compilare tutti i campi per il cambio bisello.', 'error');
                return;
            }
            posizione = latoBiselloSelect.value;
            tipoSpecifico = fornitoreBiselloSelect.value;
        }

        const nuovaOperazione = {
            macchina: macchinaSelect.value,
            posizione: posizione,
            tipo: tipo,
            tipoSpecifico: tipoSpecifico,
            operatore: operatore,
            turno: turnoSelect.value,
            modulo: moduloSelect.value
        };

        console.log('Dati dell\'operazione:', nuovaOperazione); // Per debug
        inviaOperazione(nuovaOperazione);
    });

    // Impostazione del turno corrente automaticamente all'avvio
    turnoSelect.value = getTurnoCorrente();

    // Popola la tabella delle ultime operazioni all'avvio
    getUltimeOperazioni();

    // Inizializza la visibilità dei dettagli
    toggleDetailsVisibility();
});