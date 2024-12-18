// Variabili globali e configurazione
let currentUser = null;
let weeklyChartInstance = null;
let grindingTypeChartInstance = null;
let inactivityTimer;
let historyCache = null;
let lastCacheUpdate = null;

// Costanti
const DELETE_TIMEOUT = 5 * 60 * 1000; // 5 minuti
const INACTIVITY_TIMEOUT = 30 * 60 * 1000; // 30 minuti
const CACHE_DURATION = 5 * 60 * 1000; // 5 minuti
const COMPRESSION_ENABLED = true;
const DATA_VERSION = '1.0.0';

// Inizializzazione dell'applicazione
document.addEventListener('DOMContentLoaded', () => {
    initializeApp();
    setupEventListeners();
    startClock();
    loadRecentHistoryOnLogin();
});

function initializeApp() {
    window.users = loadUsersFromLocalStorage();
    setupInactivityMonitoring();
    setupAutomaticBackup();
    initializeStorageSystem();
    checkDataVersion();
}

// Sposta la definizione di refreshAllStats prima del suo utilizzo
function refreshAllStats() {
    if (!currentUser || currentUser.role !== 'supervisor') return;

    try {
        showLoadingOverlay();
        const history = getHistory();
        updateStatistics(history);
        updateGrindingStats(); // Aggiungi questa linea
        updateTopOperators(history);
        
        const weeklyData = calculateWeeklyData(history);
        const typeData = calculateTypeData(history);
        
        updateWeeklyChart(weeklyData);
        updateGrindingTypeChart(typeData);
        
        showNotification('Statistiche aggiornate con successo', 'success');
    } catch (error) {
        console.error('Errore nell\'aggiornamento delle statistiche:', error);
        showNotification('Errore nell\'aggiornamento delle statistiche', 'error');
    } finally {
        hideLoadingOverlay();
    }
}

// Funzioni helper per l'aggiornamento dei grafici
function updateWeeklyChart(data) {
    if (weeklyChartInstance) {
        weeklyChartInstance.data.datasets[0].data = data;
        weeklyChartInstance.update('none');
    } else {
        setupWeeklyChart(data);
    }
}

function updateGrindingTypeChart(data) {
    if (grindingTypeChartInstance) {
        grindingTypeChartInstance.data.datasets[0].data = Object.values(data);
        grindingTypeChartInstance.data.labels = Object.keys(data);
        grindingTypeChartInstance.update('none');
    } else {
        setupGrindingTypeChart(data);
    }
}

function setupEventListeners() {
    // Form events
    document.getElementById('loginForm')?.addEventListener('submit', handleLogin);
    document.getElementById('logoutButton')?.addEventListener('click', handleLogout);
    document.getElementById('toolForm')?.addEventListener('submit', handleToolSubmit);
    document.getElementById('module')?.addEventListener('change', validatePosition);
    document.getElementById('position')?.addEventListener('input', validatePosition);
    document.getElementById('failureReason')?.addEventListener('change', toggleOtherReason);
	document.getElementById('username').addEventListener('input', toggleGrindingMachineSelect);
	
	
	const usernameInput = document.getElementById('username');
    if (usernameInput) {
        usernameInput.addEventListener('input', toggleGrindingMachineSelect);
    }
    
    // Import/Export events
    document.getElementById('exportCSV')?.addEventListener('click', handleExport);
    document.getElementById('exportPDF')?.addEventListener('click', handleExportPDF);
    document.getElementById('importButton')?.addEventListener('click', handleImport);
    
    // Filter events
    document.getElementById('applyFilters')?.addEventListener('click', handleFilterApply);
    document.getElementById('resetFilters')?.addEventListener('click', resetFilters);
    
    // Cross-tab synchronization
    window.addEventListener('storage', handleStorageChange);
}

function setupInactivityMonitoring() {
    ['mousemove', 'keypress', 'click', 'scroll'].forEach(event => {
        document.addEventListener(event, resetInactivityTimer);
    });
    resetInactivityTimer();
}

// Storage initialization
function initializeStorageSystem() {
    if (!isStorageAvailable()) {
        showNotification('Storage non disponibile. Modalità fallback attiva.', 'warning');
    }
}

function isStorageAvailable() {
    try {
        const test = '__storage_test__';
        localStorage.setItem(test, test);
        localStorage.removeItem(test);
        return true;
    } catch (e) {
        return false;
    }
}

// Sistema di versioning dei dati
function checkDataVersion() {
    const currentVersion = localStorage.getItem('dataVersion');
    if (currentVersion !== DATA_VERSION) {
        migrateData(currentVersion, DATA_VERSION);
        localStorage.setItem('dataVersion', DATA_VERSION);
    }
}

function migrateData(fromVersion, toVersion) {
    try {
        const history = getHistory();
        // Implementa qui la logica di migrazione per versioni specifiche se necessario
        saveHistory(history);
        showNotification(`Dati migrati con successo alla versione ${toVersion}`, 'success');
    } catch (error) {
        console.error('Errore nella migrazione dei dati:', error);
        showNotification('Errore nella migrazione dei dati', 'error');
    }
}

// Gestione cache e storage
function getHistory() {
    if (historyCache && lastCacheUpdate && (Date.now() - lastCacheUpdate < CACHE_DURATION)) {
        return historyCache;
    }

    try {
        const data = localStorage.getItem('toolHistory');
        if (!data) return [];
        
        const decompressed = COMPRESSION_ENABLED ? decompressData(data) : JSON.parse(data);
        historyCache = decompressed;
        lastCacheUpdate = Date.now();
        return historyCache;
    } catch (error) {
        handleStorageError(error);
        return historyCache || [];
    }
}

function saveHistory(history) {
    try {
        const data = COMPRESSION_ENABLED ? compressData(history) : JSON.stringify(history);
        localStorage.setItem('toolHistory', data);
        historyCache = history;
        lastCacheUpdate = Date.now();
        return true;
    } catch (error) {
        handleStorageError(error);
        return false;
    }
}

function handleStorageError(error) {
    if (error.name === 'QuotaExceededError' || error.name === 'NS_ERROR_DOM_QUOTA_REACHED') {
        showNotification('Spazio di archiviazione esaurito. Esporta i dati.', 'error');
    } else if (!isStorageAvailable()) {
        showNotification('Storage non disponibile. Modalità di sola lettura.', 'warning');
    } else {
        console.error('Errore nel gestire lo storage:', error);
        showNotification('Errore nella gestione dei dati', 'error');
    }
}

// Funzioni di compressione corrette
function compressData(data) {
    if (!COMPRESSION_ENABLED) return JSON.stringify(data);
    try {
        const jsonString = JSON.stringify(data);
        // Prima codifica in URI, poi in base64
        const encoded = encodeURIComponent(jsonString);
        const compressed = btoa(encoded);
        return compressed;
    } catch (error) {
        console.error('Errore nella compressione:', error);
        return JSON.stringify(data);
    }
}

function decompressData(compressed) {
    if (!COMPRESSION_ENABLED) return JSON.parse(compressed);
    try {
        // Decodifica prima da base64, poi da URI encoding
        const decoded = atob(compressed);
        const jsonString = decodeURIComponent(decoded);
        return JSON.parse(jsonString);
    } catch (firstError) {
        console.error('Errore nella decompressione base64:', firstError);
        try {
            // Se la decompressione fallisce, prova come JSON normale
            return JSON.parse(compressed);
        } catch (secondError) {
            console.error('Errore nel parsing JSON:', secondError);
            // Se anche il parsing fallisce, prova a decodificare solo l'URI
            try {
                return JSON.parse(decodeURIComponent(compressed));
            } catch (thirdError) {
                console.error('Tutti i tentativi di decompressione falliti:', thirdError);
                return [];
            }
        }
    }
}

// Aggiorna anche la funzione di migrazione per essere più robusta
function migrateData(fromVersion, toVersion) {
    try {
        let history = [];
        const data = localStorage.getItem('toolHistory');
        
        if (data) {
            try {
                // Prova prima a decomprimere
                history = decompressData(data);
            } catch (error) {
                console.warn('Decompressione fallita durante la migrazione:', error);
                try {
                    // Se fallisce, prova a parsare come JSON normale
                    history = JSON.parse(data);
                } catch (secondError) {
                    console.warn('Parsing JSON fallito durante la migrazione:', secondError);
                    try {
                        // Ultimo tentativo: decode URI
                        history = JSON.parse(decodeURIComponent(data));
                    } catch (thirdError) {
                        console.error('Tutti i tentativi di parsing falliti:', thirdError);
                        history = [];
                    }
                }
            }
        }

        // Assicurati che history sia un array
        if (!Array.isArray(history)) {
            console.warn('History non è un array, inizializzo array vuoto');
            history = [];
        }

        // Salva i dati nel nuovo formato
        saveHistory(history);
        localStorage.setItem('dataVersion', toVersion);
        showNotification(`Dati migrati con successo alla versione ${toVersion}`, 'success');
    } catch (error) {
        console.error('Errore nella migrazione dei dati:', error);
        showNotification('Errore nella migrazione dei dati', 'error');
    }
}

// Funzione per creare le righe della tabella storico
function createHistoryRow(entry, isRecent = false) {
    const row = document.createElement('tr');
    const timeSinceCreation = Date.now() - new Date(entry.timestamp).getTime();
    const canDelete = currentUser?.role === 'supervisor' || 
                     (entry.operator === currentUser?.username && timeSinceCreation <= DELETE_TIMEOUT);

    // Formatta la visualizzazione della rettifica
    const rettificaDisplay = entry.grindingMachine ? `Rettifica ${entry.grindingMachine}` : 'N/A';

    let html = `
        <td>${entry.operator}</td>
        <td>${rettificaDisplay}</td>
        <td>${entry.position}</td>
        <td>${entry.grindingType}</td>
        <td>${entry.shift}</td>
        <td>${new Date(entry.timestamp).toLocaleString('it-IT')}</td>
    `;

    // Aggiungi la colonna motivo solo se non è una vista recente
    if (!isRecent) {
        html += `<td>${entry.failureReason}${entry.otherReason ? ` (${entry.otherReason})` : ''}</td>`;
    }

    // Aggiungi sempre la colonna azioni
    html += `
        <td>
            ${canDelete ? `
                <button class="btn btn-sm btn-danger" onclick="handleDelete('${entry.id}')">
                    <i class="fas fa-trash"></i>
                </button>
            ` : ''}
        </td>
    `;

    row.innerHTML = html;
    if (!canDelete) {
        row.classList.add('disabled-row');
    }
    return row;
}

function updateTableHeaders() {
    // Update login page table header
    const loginTableHeader = `
        <tr>
            <th>Operatore</th>
            <th>Rettifica</th>
            <th>Posizione</th>
            <th>Tipo Mola</th>
            <th>Turno</th>
            <th>Data e Ora</th>
			<th>Cancella</th>
        </tr>
    `;

    // Update supervisor view table header
    const supervisorTableHeader = `
        <tr>
            <th>Operatore</th>
            <th>Rettifica</th>
            <th>Posizione</th>
            <th>Tipo Mola</th>
            <th>Turno</th>
            <th>Data e Ora</th>
            <th>Motivo</th>
            <th>Azioni</th>
        </tr>
    `;

    // Aggiorna gli headers delle tabelle
    document.querySelectorAll('.table thead').forEach(thead => {
        if (thead.closest('#historyTable')) {
            thead.innerHTML = supervisorTableHeader;
        } else {
            thead.innerHTML = loginTableHeader;
        }
    });
}
// Sincronizzazione tra schede
function handleStorageChange(e) {
    if (e.key === 'toolHistory') {
        invalidateCache();
        if (currentUser) {
            loadHistory();
            loadRecentHistory();
            if (currentUser.role === 'supervisor') {
                refreshAllStats();
            }
        }
    }
}

function invalidateCache() {
    historyCache = null;
    lastCacheUpdate = null;
}

// Gestione autenticazione
function handleLogin(e) {
    e.preventDefault();
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();
    const grindingMachine = document.getElementById('grindingMachine').value;

    const user = window.users.find(u => u.username === username && u.password === password);
    
    if (user) {
        currentUser = {
            ...user,
            grindingMachine: user.role === 'supervisor' ? null : grindingMachine
        };

        // Verifica se l'utente è un operatore e ha selezionato una rettifica
        if (user.role === 'operator' && !grindingMachine) {
            showNotification('Seleziona una rettifica', 'error');
            return;
        }
        
        showAppropriateView();
        showNotification(`Benvenuto ${username}!`, 'success');
        resetInactivityTimer();
    } else {
        showNotification('Credenziali non valide', 'error');
    }
}

function handleLogout() {
    currentUser = null;
    clearTimeout(inactivityTimer);
    invalidateCache();
    
    document.getElementById('appSection').style.display = 'none';
    document.getElementById('loginSection').style.display = 'block';
    document.getElementById('logoutButton').style.display = 'none';
    document.getElementById('operatorView').style.display = 'none';
    document.getElementById('supervisorView').style.display = 'none';
    
    document.getElementById('loginForm').reset();
    showNotification('Logout effettuato con successo', 'success');
}

function resetInactivityTimer() {
    clearTimeout(inactivityTimer);
    if (currentUser) {
        inactivityTimer = setTimeout(handleLogout, INACTIVITY_TIMEOUT);
    }
}

// Gestione UI
function showAppropriateView() {
    document.getElementById('loginSection').style.display = 'none';
    document.getElementById('appSection').style.display = 'block';
    document.getElementById('logoutButton').style.display = 'block';

    if (currentUser.role === 'operator') {
        document.getElementById('operatorView').style.display = 'block';
        document.getElementById('supervisorView').style.display = 'none';
    } else {
        document.getElementById('supervisorView').style.display = 'block';
        document.getElementById('operatorView').style.display = 'none';
        try {
            initializeSupervisorDashboard();
        } catch (error) {
            console.warn('Errore nell\'inizializzazione dashboard supervisor:', error);
        }
    }

    determineShift();
    loadHistory();
    loadRecentHistory();
}

function startClock() {
    const clockElement = document.getElementById('currentTime');
    if (!clockElement) return;

    const updateClock = () => {
        const now = new Date();
        clockElement.textContent = now.toLocaleTimeString('it-IT', {
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit'
        });
    };

    updateClock();
    setInterval(updateClock, 1000);
}

function showNotification(message, type = 'info') {
    const notification = document.getElementById('notification');
    if (!notification) return;

    notification.textContent = message;
    notification.className = `notification ${type}`;
    notification.style.display = 'block';

    notification.style.animation = 'none';
    notification.offsetHeight; // Trigger reflow
    notification.style.animation = 'slideIn 0.3s ease-out';

    setTimeout(() => {
        notification.style.display = 'none';
    }, 3000);
}

function showLoadingOverlay() {
    const overlay = document.getElementById('loadingOverlay');
    if (overlay) overlay.classList.add('active');
}

function hideLoadingOverlay() {
    const overlay = document.getElementById('loadingOverlay');
    if (overlay) overlay.classList.remove('active');
}

// Gestione form mole
function handleToolSubmit(e) {
    e.preventDefault();
    if (!validatePosition()) return;

    const formData = getFormData();
    const newEntry = {
        ...formData,
        id: Date.now().toString(),
        operator: currentUser.username,
        grindingMachine: currentUser.grindingMachine, // Assicurati che la rettifica sia sempre inclusa
        timestamp: new Date().toISOString()
    };

    const history = getHistory();
    history.unshift(newEntry);
    if (saveHistory(history)) {
        document.getElementById('toolForm').reset();
        determineShift();
        loadHistory();
        loadRecentHistory();
        
        if (currentUser.role === 'supervisor') {
            refreshAllStats();
        }

        showNotification('Cambio registrato con successo', 'success');
    }
}

function getFormData() {
    return {
        module: document.getElementById('module').value,
        position: document.getElementById('position').value,
        grindingType: document.getElementById('grindingType').value,
        shift: document.getElementById('shift').value,
        failureReason: document.getElementById('failureReason').value,
        otherReason: document.getElementById('otherReason').value || ''
    };
}

function validatePosition() {
    const grindingMachine = currentUser.grindingMachine;
    const position = parseInt(document.getElementById('position').value);
    const maxPosition = MACHINE_POSITIONS[grindingMachine];
    const feedback = document.getElementById('positionFeedback');
    const input = document.getElementById('position');

    const isValid = position >= 1 && position <= maxPosition;
    input.classList.toggle('is-invalid', !isValid);
    feedback.style.display = isValid ? 'none' : 'block';
    feedback.textContent = `Posizione non valida per la rettifica ${grindingMachine} (max: ${maxPosition})`;
    return isValid;
}

function toggleOtherReason() {
    const container = document.getElementById('otherReasonContainer');
    const otherReason = document.getElementById('otherReason');
    const showOther = this.value === 'Altro';
    
    container.style.display = showOther ? 'block' : 'none';
    otherReason.required = showOther;
    if (!showOther) otherReason.value = '';
}

function determineShift() {
    const now = new Date();
    const hour = now.getHours();
    const shift = hour >= 6 && hour < 14 ? 'Mattina' : 
                 hour >= 14 && hour < 22 ? 'Pomeriggio' : 'Notte';
    
    document.getElementById('shift').value = shift;
}

// Gestione tabelle
function loadHistory() {
    const history = getHistory();
    const tbody = document.getElementById('historyTable')?.querySelector('tbody');
    if (!tbody) return;

    tbody.innerHTML = '';
    history.forEach(entry => {
        const row = createHistoryRow(entry);
        tbody.appendChild(row);
    });
}

function loadRecentHistory() {
    const history = getHistory();
    const tbody = document.getElementById('recentHistoryTable')?.querySelector('tbody');
    if (!tbody) return;

    tbody.innerHTML = '';
    history.slice(0, 10).forEach(entry => {
        const row = createHistoryRow(entry, true);
        tbody.appendChild(row);
    });
}

function loadRecentHistoryOnLogin() {
    const history = getHistory();
    const tbody = document.getElementById('recentHistoryTableLogin')?.querySelector('tbody');
    if (!tbody) return;

    tbody.innerHTML = '';
    history.slice(0, 10).forEach(entry => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${entry.operator}</td>
            <td>${entry.module}</td>
            <td>${entry.position}</td>
            <td>${entry.grindingType}</td>
            <td>${entry.shift}</td>
            <td>${new Date(entry.timestamp).toLocaleString('it-IT')}</td>
        `;
        tbody.appendChild(row);
    });
}

// Dashboard Supervisore
function initializeSupervisorDashboard() {
    updateStatistics();
    updateGrindingStats(); // Aggiungi questa linea
    setupCharts();
    populateFilters();
    updateTopOperators();
}

function updateStatistics() {
    if (!currentUser || currentUser.role !== 'supervisor') return;

    try {
        const history = getHistory();
        const today = new Date().toISOString().split('T')[0];
        
        // Statistiche del giorno
        const todayChangesElement = document.getElementById('todayChanges');
        if (todayChangesElement) {
            const todayChanges = history.filter(h => h.timestamp.startsWith(today)).length;
            todayChangesElement.textContent = todayChanges;
        }

        // Statistiche per rettifica
        GRINDING_MACHINES.dry.machines.concat(GRINDING_MACHINES.wet.machines).forEach(machine => {
            const statsElement = document.getElementById(`stats-machine-${machine}`);
            if (statsElement) {
                const machineHistory = history.filter(h => h.grindingMachine === machine);
                const stats = {
                    total: machineHistory.length,
                    today: machineHistory.filter(h => h.timestamp.startsWith(today)).length,
                    defective: machineHistory.filter(h => h.failureReason === 'Difetto').length
                };
                
                statsElement.innerHTML = `
                    <h5>Rettifica ${machine}</h5>
                    <p>Totale: ${stats.total}</p>
                    <p>Oggi: ${stats.today}</p>
                    <p>Difetti: ${stats.defective}</p>
                `;
            }
        });
    } catch (error) {
        console.warn('Errore nell\'aggiornamento delle statistiche:', error);
    }
}

// Inizializza tutto quando il documento è pronto
document.addEventListener('DOMContentLoaded', () => {
    updateTableHeaders();
    if (currentUser?.role === 'supervisor') {
        updateStatistics();
    }
});

// Gestione efficiente dei grafici
function setupCharts() {
    const history = getHistory();
    const weeklyData = calculateWeeklyData(history);
    const typeData = calculateTypeData(history);
    
    setupWeeklyChart(weeklyData);
    setupGrindingTypeChart(typeData);
}

function setupWeeklyChart(data) {
    const ctx = document.getElementById('weeklyChart')?.getContext('2d');
    if (!ctx) return;

    const labels = Array(7).fill().map((_, i) => {
        const date = new Date();
        date.setDate(date.getDate() - i);
        return date.toLocaleDateString('it-IT', { weekday: 'short', day: 'numeric' });
    }).reverse();

    if (weeklyChartInstance) {
        weeklyChartInstance.destroy();
    }

    weeklyChartInstance = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Cambi Giornalieri',
                data: data,
                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: { stepSize: 1 }
                }
            },
            plugins: {
                legend: {
                    display: true,
                    position: 'top'
                },
                title: {
                    display: true,
                    text: 'Andamento Settimanale Cambi Mole'
                }
            }
        }
    });
}

function setupGrindingTypeChart(data) {
    const ctx = document.getElementById('grindingTypeChart')?.getContext('2d');
    if (!ctx) return;

    if (grindingTypeChartInstance) {
        grindingTypeChartInstance.destroy();
    }

    grindingTypeChartInstance = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: Object.keys(data),
            datasets: [{
                data: Object.values(data),
                backgroundColor: [
                    'rgba(255, 99, 132, 0.8)',
                    'rgba(54, 162, 235, 0.8)',
                    'rgba(255, 206, 86, 0.8)',
                    'rgba(75, 192, 192, 0.8)',
                    'rgba(153, 102, 255, 0.8)'
                ],
                borderColor: 'white',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { position: 'right' },
                title: {
                    display: true,
                    text: 'Distribuzione Tipi di Mole'
                }
            }
        }
    });
}

function updateTopOperators() {
    const history = getHistory();
    const operatorStats = {};
    
    history.forEach(entry => {
        operatorStats[entry.operator] = (operatorStats[entry.operator] || 0) + 1;
    });

    const sortedOperators = Object.entries(operatorStats)
        .sort(([, a], [, b]) => b - a)
        .slice(0, 3);

    const container = document.getElementById('topOperators');
    if (!container) return;

    container.innerHTML = '';

    const medals = ['gold', 'silver', 'bronze'];
    const icons = ['🥇', '🥈', '🥉'];

    sortedOperators.forEach(([operator, count], index) => {
        const col = document.createElement('div');
        col.className = 'col-md-4';
        col.innerHTML = `
            <div class="top-operator-card ${medals[index]}">
                <div class="position">${icons[index]}</div>
                <div class="name">${operator}</div>
                <div class="count">${count} cambi</div>
            </div>
        `;
        container.appendChild(col);
    });
}

// Calcolo dati per i grafici
function calculateWeeklyData(history) {
    const lastWeek = new Date();
    lastWeek.setDate(lastWeek.getDate() - 7);
    
    const dailyData = Array(7).fill(0);
    
    history.forEach(entry => {
        const entryDate = new Date(entry.timestamp);
        if (entryDate >= lastWeek) {
            const dayIndex = 6 - Math.floor((Date.now() - entryDate) / (1000 * 60 * 60 * 24));
            if (dayIndex >= 0 && dayIndex < 7) {
                dailyData[dayIndex]++;
            }
        }
    });
    
    return dailyData;
}

function calculateTypeData(history) {
    const typeCount = {};
    history.forEach(entry => {
        typeCount[entry.grindingType] = (typeCount[entry.grindingType] || 0) + 1;
    });
    return typeCount;
}

// Gestione filtri
function populateFilters() {
    // Popola il select delle rettifiche
    const rettificaSelect = document.getElementById('filterGrindingMachine');
    if (rettificaSelect) {
        // Combina tutte le rettifiche disponibili
        const allMachines = [
            ...GRINDING_MACHINES.dry.machines,
            ...GRINDING_MACHINES.wet.machines
        ].sort((a, b) => parseInt(a) - parseInt(b));

        // Crea le opzioni
        rettificaSelect.innerHTML = `
            <option value="">Tutte</option>
            ${allMachines.map(machine => `
                <option value="${machine}">Rettifica ${machine}</option>
            `).join('')}
        `;
    }

    // Ottieni solo gli utenti con ruolo "operator" da window.users
    const operators = window.users
        .filter(user => user.role === 'operator')
        .map(user => user.username);

    // Popola il select degli operatori
    const operatorSelect = document.getElementById('filterOperator');
    if (operatorSelect) {
        operatorSelect.innerHTML = '<option value="">Tutti</option>' + 
            operators.map(op => `<option value="${op}">${op}</option>`).join('');
    }

    // Popola i tipi di mola dallo storico
    const history = getHistory();
    const types = [...new Set(history.map(h => h.grindingType))].sort();
    const typeSelect = document.getElementById('filterGrindingType');
    if (typeSelect) {
        typeSelect.innerHTML = '<option value="">Tutti</option>' + 
            types.map(type => `<option value="${type}">${type}</option>`).join('');
    }

    // Aggiungi gli event listener per la validazione della posizione
    const rettificaFilterSelect = document.getElementById('filterGrindingMachine');
    const positionFilterInput = document.getElementById('filterPosition');
    
    if (rettificaFilterSelect && positionFilterInput) {
        rettificaFilterSelect.addEventListener('change', () => {
            const selectedRettifica = rettificaFilterSelect.value;
            if (selectedRettifica) {
                positionFilterInput.max = MACHINE_POSITIONS[selectedRettifica];
            }
        });

        positionFilterInput.addEventListener('input', () => {
            const selectedRettifica = rettificaFilterSelect.value;
            if (selectedRettifica) {
                const maxPosition = MACHINE_POSITIONS[selectedRettifica];
                const currentValue = parseInt(positionFilterInput.value);
                if (currentValue > maxPosition) {
                    positionFilterInput.value = maxPosition;
                }
            }
        });
    }
}

function updateHistoryTable(filteredHistory) {
    const tbody = document.getElementById('historyTable')?.querySelector('tbody');
    if (!tbody) return;

    // Pulisci la tabella esistente
    tbody.innerHTML = '';

    if (filteredHistory.length === 0) {
        // Se non ci sono risultati, mostra un messaggio
        const row = document.createElement('tr');
        row.innerHTML = `<td colspan="8" class="text-center">Nessun risultato trovato</td>`;
        tbody.appendChild(row);
        return;
    }

    // Popola la tabella con i risultati filtrati
    filteredHistory.forEach(entry => {
        const row = createHistoryRow(entry);
        tbody.appendChild(row);
    });
}

function filterHistory(history, filters) {
    return history.filter(entry => {
        const entryDate = entry.timestamp.split('T')[0];
        return (!filters.dateStart || entryDate >= filters.dateStart) &&
               (!filters.dateEnd || entryDate <= filters.dateEnd) &&
               (!filters.operator || entry.operator === filters.operator) &&
               (!filters.grindingType || entry.grindingType === filters.grindingType) &&
               (!filters.grindingMachine || entry.grindingMachine === filters.grindingMachine) &&
               (!filters.position || parseInt(entry.position) === parseInt(filters.position));
    });
}

function handleFilterApply() {
    const filters = {
        dateStart: document.getElementById('filterDateStart')?.value,
        dateEnd: document.getElementById('filterDateEnd')?.value,
        operator: document.getElementById('filterOperator')?.value,
        grindingType: document.getElementById('filterGrindingType')?.value,
        grindingMachine: document.getElementById('filterGrindingMachine')?.value,
        position: document.getElementById('filterPosition')?.value
    };

    const history = getHistory();
    const filteredHistory = filterHistory(history, filters);
    updateHistoryTable(filteredHistory);
}

function updateGrindingTypeOptions() {
    const grindingType = document.getElementById('grindingType');
    if (!grindingType) return;

    const machine = currentUser.grindingMachine;
    const isWet = GRINDING_MACHINES.wet.machines.includes(machine);
    const wheels = isWet ? GRINDING_MACHINES.wet.wheels : GRINDING_MACHINES.dry.wheels;

    grindingType.innerHTML = '<option value="">Seleziona Tipo</option>' +
        wheels.map(wheel => `<option value="${wheel}">${wheel}</option>`).join('');
}

function resetFilters() {
    ['filterDateStart', 'filterDateEnd', 'filterOperator', 'filterGrindingType', 
     'filterGrindingMachine', 'filterPosition'].forEach(id => {
        const element = document.getElementById(id);
        if (element) element.value = '';
    });
    
    loadHistory();
    showNotification('Filtri resettati', 'success');
}

function handleDelete(id) {
    if (!confirm('Sei sicuro di voler eliminare questo record?')) return;

    const history = getHistory();
    const entryIndex = history.findIndex(h => h.id === id);
    if (entryIndex === -1) return;

    const entry = history[entryIndex];
    const timeSinceCreation = Date.now() - new Date(entry.timestamp).getTime();

    if (currentUser.role === 'supervisor' || 
        (entry.operator === currentUser.username && timeSinceCreation <= DELETE_TIMEOUT)) {
        history.splice(entryIndex, 1);
        if (saveHistory(history)) {
            loadHistory();
            loadRecentHistory();
            refreshAllStats();
            showNotification('Record eliminato con successo', 'success');
        }
    } else {
        showNotification('Non hai i permessi per eliminare questo record', 'error');
    }
}

// Sistema di backup automatico
function setupAutomaticBackup() {
    const now = new Date();
    const scheduledTime = new Date(
        now.getFullYear(),
        now.getMonth(),
        now.getDate(),
        7, // 07:00
        0,
        0
    );
    
    // Se l'ora corrente è dopo le 7:00, programma per il giorno successivo
    if (now > scheduledTime) {
        scheduledTime.setDate(scheduledTime.getDate() + 1);
    }
    
    const timeUntilBackup = scheduledTime - now;
    
    // Programma il primo backup
    setTimeout(() => {
        performBackup();
        // Imposta i backup successivi ogni 24 ore
        setInterval(performBackup, 24 * 60 * 60 * 1000);
    }, timeUntilBackup);
}

// Sistema di backup con retry
async function performBackup(retryCount = 3, delay = 5000) {
    for (let attempt = 1; attempt <= retryCount; attempt++) {
        try {
            const history = getHistory();
            const date = new Date().toLocaleDateString('it-IT').replace(/\//g, '-');
            
            // Crea il file CSV
            const csv = generateCSV(history);
            
            // Salva il file localmente
            await saveBackupLocally(csv, date);

            // Invia il backup via email
            await sendBackupEmail(csv, date);
            
            console.log('Backup completato con successo');
            return true;
        } catch (error) {
            console.error(`Tentativo ${attempt} fallito:`, error);
            
            if (attempt < retryCount) {
                console.log(`Nuovo tentativo tra ${delay/1000} secondi...`);
                await new Promise(resolve => setTimeout(resolve, delay));
            } else {
                showNotification('Backup fallito dopo multipli tentativi', 'error');
                return false;
            }
        }
    }
}

async function saveBackupLocally(csv, date) {
    const blob = new Blob([csv], { type: 'text/csv' });
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.href = url;
    link.download = `backup_mole_${date}.csv`;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    URL.revokeObjectURL(url);
}

async function sendBackupEmail(csv, date) {
    try {
        const response = await fetch('/api/send-backup', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                subject: `Backup Registro Mole ${date}`,
                text: `In allegato il backup del registro mole del ${date}`,
                attachment: {
                    filename: `backup_mole_${date}.csv`,
                    content: csv
                }
            })
        });

        if (!response.ok) {
            throw new Error('Errore nell\'invio dell\'email');
        }
    } catch (error) {
        console.error('Errore nell\'invio dell\'email:', error);
        showNotification('Errore nell\'invio dell\'email di backup', 'error');
        throw error; // Rilancia l'errore per gestirlo nel sistema di retry
    }
}

// Funzione helper per generare CSV
function generateCSV(history) {
    const headers = ['Operatore', 'Rettifica', 'Posizione', 'Tipo Mola', 'Turno', 'Data e Ora', 'Motivo', 'Dettagli'];
    
    const rows = history.map(entry => {
        const date = new Date(entry.timestamp);
        const formattedDate = date.toLocaleString('it-IT').replace(',', '');

        return [
            entry.operator,
            entry.grindingMachine,
            entry.position,
            entry.grindingType,
            entry.shift,
            formattedDate,
            entry.failureReason,
            entry.otherReason || ''
        ].map(cell => `"${cell}"`).join(',');
    });
    
    return [headers.join(','), ...rows].join('\n');
}

// Gestione Export
function handleExport() {
    showLoadingOverlay();
    
    setTimeout(() => {
        try {
            const history = getHistory();
            const csv = generateCSV(history);
            downloadFile(csv, `registro_mole_${new Date().toLocaleDateString('it-IT')}.csv`, 'text/csv');
            showNotification('Esportazione completata con successo', 'success');
        } catch (error) {
            console.error('Errore durante l\'esportazione:', error);
            showNotification('Errore durante l\'esportazione', 'error');
        } finally {
            hideLoadingOverlay();
        }
    }, 500);
}

function handleExportPDF() {
    if (!window.jspdf) {
        showNotification('Libreria PDF non caricata', 'error');
        return;
    }

    showLoadingOverlay();
    
    setTimeout(() => {
        try {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();
            
            // Intestazione
            doc.setFontSize(20);
            doc.text('Report Cambio Mole', 14, 20);
            
            // Data generazione
            doc.setFontSize(11);
            doc.text(`Data di generazione: ${new Date().toLocaleString('it-IT')}`, 14, 30);
            
            // Statistiche generali
            const history = getHistory();
            addStatsToPDF(doc, history);
            
            // Tabella ultimi cambi
            doc.addPage();
            addTableToPDF(doc, history.slice(0, 20));

            // Grafici
            if (weeklyChartInstance || grindingTypeChartInstance) {
                doc.addPage();
                addChartsToPDF(doc);
            }

            // Top operatori
            doc.addPage();
            addTopOperatorsToPDF(doc);

            // Salva il PDF
            doc.save(`report_mole_${new Date().toLocaleDateString('it-IT')}.pdf`);
            showNotification('PDF generato con successo', 'success');
        } catch (error) {
            console.error('Errore nella generazione del PDF:', error);
            showNotification('Errore nella generazione del PDF', 'error');
        } finally {
            hideLoadingOverlay();
        }
    }, 500);
}

// Funzioni helper per PDF
function addStatsToPDF(doc, history) {
    const stats = calculateStats(history);
    
    doc.setFontSize(14);
    doc.text('Statistiche Generali', 14, 45);
    
    doc.setFontSize(11);
    const statsText = [
        `Totale cambi: ${stats.total}`,
        `Cambi ultima settimana: ${stats.weekly}`,
        `Mole difettose: ${stats.defective}`,
        `Media giornaliera: ${stats.dailyAverage}`,
        `Tipo mola più utilizzato: ${stats.mostUsedType}`,
        `Operatore più attivo: ${stats.topOperator}`
    ];
    
    statsText.forEach((text, i) => {
        doc.text(text, 14, 55 + (i * 7));
    });
}

function addTableToPDF(doc, history) {
    doc.setFontSize(14);
    doc.text('Ultimi Cambi Registrati', 14, 20);

    const headers = ['Operatore', 'Modulo', 'Posizione', 'Tipo', 'Turno', 'Data', 'Motivo'];
    const rows = history.map(entry => [
        entry.operator,
        entry.module,
        entry.position,
        entry.grindingType,
        entry.shift,
        new Date(entry.timestamp).toLocaleString('it-IT'),
        `${entry.failureReason}${entry.otherReason ? ` (${entry.otherReason})` : ''}`
    ]);

    doc.autoTable({
        startY: 30,
        head: [headers],
        body: rows,
        theme: 'striped',
        headStyles: { fillColor: [41, 128, 185] },
        styles: { fontSize: 8, cellPadding: 2 }
    });
}

function addChartsToPDF(doc) {
    doc.setFontSize(14);
    doc.text('Grafici Statistici', 14, 20);

    try {
        if (weeklyChartInstance) {
            const weeklyChartImg = document.getElementById('weeklyChart').toDataURL();
            doc.addImage(weeklyChartImg, 'PNG', 14, 30, 180, 80);
        }

        if (grindingTypeChartInstance) {
            const typeChartImg = document.getElementById('grindingTypeChart').toDataURL();
            doc.addImage(typeChartImg, 'PNG', 14, 120, 180, 80);
        }
    } catch (error) {
        console.error('Errore nell\'aggiunta dei grafici:', error);
        doc.text('Errore nel caricamento dei grafici', 14, 30);
    }
}

function addTopOperatorsToPDF(doc) {
    const history = getHistory();
    const operatorStats = {};
    
    history.forEach(entry => {
        operatorStats[entry.operator] = (operatorStats[entry.operator] || 0) + 1;
    });

    const sortedOperators = Object.entries(operatorStats)
        .sort(([, a], [, b]) => b - a)
        .slice(0, 3);

    doc.setFontSize(14);
    doc.text('Top Operatori', 14, 20);

    sortedOperators.forEach(([operator, count], index) => {
        doc.setFontSize(12);
        doc.text(`${index + 1}. ${operator}: ${count} cambi`, 14, 35 + (index * 10));
    });
}

// Funzioni utilità
function downloadFile(content, fileName, contentType) {
    const blob = new Blob([content], { type: contentType });
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.href = url;
    link.download = fileName;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    URL.revokeObjectURL(url);
}

function calculateStats(history) {
    const now = new Date();
    const weekAgo = new Date(now - 7 * 24 * 60 * 60 * 1000);
    
    const typeCount = {};
    const operatorCount = {};
    
    history.forEach(entry => {
        typeCount[entry.grindingType] = (typeCount[entry.grindingType] || 0) + 1;
        operatorCount[entry.operator] = (operatorCount[entry.operator] || 0) + 1;
    });

    const weeklyChanges = history.filter(h => new Date(h.timestamp) >= weekAgo).length;

    return {
        total: history.length,
        weekly: weeklyChanges,
        defective: history.filter(h => h.failureReason === 'Difetto').length,
        dailyAverage: Math.round(weeklyChanges / 7),
        mostUsedType: Object.entries(typeCount).sort(([,a], [,b]) => b - a)[0]?.[0] || 'N/A',
        topOperator: Object.entries(operatorCount).sort(([,a], [,b]) => b - a)[0]?.[0] || 'N/A'
    };
}

// Gestione Import
function handleImport() {
    const fileInput = document.getElementById('importCSV');
    const file = fileInput?.files[0];
    
    if (!file) {
        showNotification('Seleziona un file da importare', 'warning');
        return;
    }

    if (file.type !== 'text/csv' && !file.name.endsWith('.csv')) {
        showNotification('Il file deve essere in formato CSV', 'error');
        return;
    }

    // Dialog di conferma con dettagli
    const existingRecords = getHistory().length;
    const confirmImport = confirm(
        `Stai per importare nuovi dati.\n\n` +
        `Record esistenti: ${existingRecords}\n` +
        `File selezionato: ${file.name}\n` +
        `Dimensione: ${(file.size / 1024).toFixed(2)} KB\n\n` +
        `I nuovi dati verranno uniti con quelli esistenti.\n` +
        `Vuoi procedere con l'importazione?`
    );

    if (!confirmImport) {
        fileInput.value = '';
        return;
    }

    showLoadingOverlay();
    const reader = new FileReader();
    reader.onload = handleFileRead;
    reader.onerror = () => {
        hideLoadingOverlay();
        showNotification('Errore nella lettura del file', 'error');
    };

    reader.readAsText(file);
}

function handleFileRead(e) {
    try {
        const text = e.target.result;
        const rows = text.split('\n')
            .map(row => row.trim())
            .filter(row => row.length > 0);

        if (rows.length < 2) {
            throw new Error('File CSV vuoto o non valido');
        }

        const headers = rows[0].split(',').map(h => h.replace(/"/g, '').trim());
        const expectedHeaders = [
            'Operatore',
            'Rettifica',
            'Posizione',
            'Tipo Mola',
            'Turno',
            'Data e Ora',
            'Motivo',
            'Dettagli'
        ];
        
        console.log('Headers trovati:', headers);
        console.log('Headers attesi:', expectedHeaders);
        
        if (!areHeadersValid(headers, expectedHeaders)) {
            throw new Error('Headers CSV non validi. Attesi: ' + expectedHeaders.join(', '));
        }

        const importedData = parseCSVRows(rows.slice(1));

        if (importedData.length === 0) {
            throw new Error('Nessun dato valido trovato nel file');
        }

        processImportedData(importedData);

    } catch (error) {
        console.error('Errore durante l\'importazione:', error);
        showNotification(`Errore durante l'importazione: ${error.message}`, 'error');
    } finally {
        hideLoadingOverlay();
    }
}

function processImportedData(importedData) {
    const existingData = getHistory();
    
    // Funzione per normalizzare il timestamp rimuovendo i secondi
    const normalizeTimestamp = (timestamp) => {
        const date = new Date(timestamp);
        date.setSeconds(0);
        return date.getTime();
    };

    // Funzione per creare una chiave univoca per ogni record
    const createUniqueKey = (entry) => {
        const timestamp = normalizeTimestamp(entry.timestamp);
        return `${entry.operator}-${entry.grindingMachine}-${entry.position}-${timestamp}`;
    };

    // Crea un map degli elementi esistenti per ricerca veloce
    const existingKeys = new Set(existingData.map(createUniqueKey));

    // Filtra solo i dati veramente nuovi
    const uniqueData = importedData.filter(imported => {
        const key = createUniqueKey(imported);
        return !existingKeys.has(key);
    });

    // Se non ci sono nuovi dati, termina qui
    if (uniqueData.length === 0) {
        showNotification('Nessun nuovo record da importare', 'warning');
        return;
    }

    // Unisci i dati e ordina per timestamp decrescente
    const mergedData = [...uniqueData, ...existingData].sort((a, b) => 
        new Date(b.timestamp) - new Date(a.timestamp)
    );

    if (saveHistory(mergedData)) {
        loadHistory();
        loadRecentHistory();
        if (currentUser?.role === 'supervisor') {
            refreshAllStats();
        }
        document.getElementById('importCSV').value = '';
        showNotification(`Importazione completata: ${uniqueData.length} nuovi record importati`, 'success');
    }
}

function parseCSVRows(rows) {
    const importedData = [];
    
    for (let i = 0; i < rows.length; i++) {
        try {
            const values = rows[i].match(/(".*?"|[^",\s]+)(?=\s*,|\s*$)/g)
                ?.map(value => value.replace(/^"(.*)"$/, '$1').trim());

            if (!values || values.length < 8) continue;

            const dateStr = values[5];
            const timestamp = parseItalianDate(dateStr);

            // Assicurati che la rettifica sia nel formato corretto
            const grindingMachine = values[1].replace(/[^0-9]/g, ''); // Estrae solo il numero

            importedData.push({
                id: `import_${Date.now()}_${i}`,
                operator: values[0],
                grindingMachine: grindingMachine,
                position: values[2],
                grindingType: values[3],
                shift: values[4],
                timestamp: timestamp.toISOString(),
                failureReason: values[6] || 'Non specificato',
                otherReason: values[7] || ''
            });
        } catch (error) {
            console.warn(`Errore nel processing della riga ${i + 1}:`, error);
            continue;
        }
    }
    
    return importedData;
}

function updateGrindingStats() {
    const history = getHistory();
    const today = new Date().toISOString().split('T')[0];
    
    // Template per una singola rettifica
    function createMachineStatsTemplate(machineId, stats) {
        return `
            <div class="machine-stat">
                <div class="machine-title">
                    <span class="title">Rettifica ${machineId}</span>
                    <span class="badge ${stats.type === 'Secco' ? 'bg-warning' : 'bg-info'}">${stats.type}</span>
                </div>
                <div class="machine-stats">
                    <div class="stat-box">
                        <span class="stat-value">${stats.total}</span>
                        <span class="stat-label">Totale</span>
                    </div>
                    <div class="stat-box">
                        <span class="stat-value">${stats.today}</span>
                        <span class="stat-label">Oggi</span>
                    </div>
                    <div class="stat-box">
                        <span class="stat-value">${stats.defects}</span>
                        <span class="stat-label">Difetti</span>
                    </div>
                </div>
            </div>
        `;
    }

    // Popola rettifiche a secco
    const dryMachinesContainer = document.getElementById('dry-machines');
    if (dryMachinesContainer) {
        let dryMachinesHTML = '';
        [0, 3, 4, 5].forEach(machineId => {
            const machineHistory = history.filter(h => h.grindingMachine === machineId.toString());
            const stats = {
                type: 'Secco',
                total: machineHistory.length,
                today: machineHistory.filter(h => h.timestamp.startsWith(today)).length,
                defects: machineHistory.filter(h => h.failureReason === 'Difetto').length
            };
            dryMachinesHTML += createMachineStatsTemplate(machineId, stats);
        });
        dryMachinesContainer.innerHTML = dryMachinesHTML;
    }

    // Popola rettifiche a umido
    const wetMachinesContainer = document.getElementById('wet-machines');
    if (wetMachinesContainer) {
        let wetMachinesHTML = '';
        [1, 2].forEach(machineId => {
            const machineHistory = history.filter(h => h.grindingMachine === machineId.toString());
            const stats = {
                type: 'Umido',
                total: machineHistory.length,
                today: machineHistory.filter(h => h.timestamp.startsWith(today)).length,
                defects: machineHistory.filter(h => h.failureReason === 'Difetto').length
            };
            wetMachinesHTML += createMachineStatsTemplate(machineId, stats);
        });
        wetMachinesContainer.innerHTML = wetMachinesHTML;
    }
}


// Support functions for import
function areHeadersValid(actual, expected) {
    return expected.every(header => 
        actual.some(h => h.toLowerCase().includes(header.toLowerCase()))
    );
}

function parseItalianDate(dateStr) {
    try {
        const [datePart, timePart] = dateStr.split(' ');
        const [day, month, year] = datePart.includes('/')
            ? datePart.split('/')
            : datePart.split('-');
            
        let [hours, minutes] = ['00', '00'];
        if (timePart) {
            [hours, minutes] = timePart.split(':');
        }
        
        const date = new Date(
            year.length === 2 ? '20' + year : year,
            parseInt(month) - 1,
            parseInt(day),
            parseInt(hours),
            parseInt(minutes)
        );
        
        if (isNaN(date.getTime())) {
            throw new Error('Data non valida');
        }
        
        return date;
    } catch (error) {
        console.error('Errore nel parsing della data:', error);
        return new Date(); // Fallback to current date
    }
}


// Funzioni di supporto per l'import
function areHeadersValid(actual, expected) {
    const actualLower = actual.map(h => h.toLowerCase().trim());
    const expectedLower = expected.map(h => h.toLowerCase().trim());
    
    // Debug log
    console.log('Header attuali (lowercase):', actualLower);
    console.log('Header attesi (lowercase):', expectedLower);
    
    const missingHeaders = expectedLower.filter(header => 
        !actualLower.some(h => h === header)
    );
    
    if (missingHeaders.length > 0) {
        console.log('Header mancanti:', missingHeaders);
    }
    
    return missingHeaders.length === 0;
}

function parseItalianDate(dateStr) {
    try {
        const [datePart, timePart] = dateStr.split(' ');
        const [day, month, year] = datePart.includes('/')
            ? datePart.split('/')
            : datePart.split('-');
            
        let [hours, minutes] = ['00', '00'];
        if (timePart) {
            [hours, minutes] = timePart.split(':');
        }
        
        const date = new Date(
            year.length === 2 ? '20' + year : year,
            parseInt(month) - 1,
            parseInt(day),
            parseInt(hours),
            parseInt(minutes)
        );
        
        if (isNaN(date.getTime())) {
            throw new Error('Data non valida');
        }
        
        return date;
    } catch (error) {
        console.error('Errore nel parsing della data:', error);
        return new Date(); // Fallback alla data corrente
    }
}

function migrateData(fromVersion, toVersion) {
    try {
        let history = [];
        const data = localStorage.getItem('toolHistory');
        
        if (data) {
            try {
                // Prima prova a parsare come JSON normale
                history = JSON.parse(data);
            } catch {
                try {
                    // Se fallisce, prova a decomprimere
                    history = decompressData(data);
                } catch {
                    // Se tutto fallisce, inizia con array vuoto
                    history = [];
                }
            }
        }

        // Salva i dati nel nuovo formato
        saveHistory(history);
        showNotification(`Dati migrati con successo alla versione ${toVersion}`, 'success');
    } catch (error) {
        console.error('Errore nella migrazione dei dati:', error);
        showNotification('Errore nella migrazione dei dati', 'error');
    }
}

function toggleGrindingMachineSelect() {
    const username = document.getElementById('username').value.trim();
    const grindingMachineContainer = document.getElementById('grindingMachineContainer');
    const grindingMachineSelect = document.getElementById('grindingMachine');
    
    if (grindingMachineContainer && grindingMachineSelect) {
        if (isAdmin(username)) {
            grindingMachineContainer.style.display = 'none';
            grindingMachineSelect.required = false;
        } else {
            grindingMachineContainer.style.display = 'block';
            grindingMachineSelect.required = true;
        }
    }
}

function isAdmin(username) {
    return username.toLowerCase() === 'aragona';
}

// Export delle funzioni globali
window.handleDelete = handleDelete;
window.handleFilterApply = handleFilterApply;
window.handleExport = handleExport;
window.handleImport = handleImport;
window.handleExportPDF = handleExportPDF;
window.resetFilters = resetFilters;
window.refreshAllStats = refreshAllStats;