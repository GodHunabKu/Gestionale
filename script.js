// Variabili globali
let currentUser = null;
let weeklyChartInstance = null;
let grindingTypeChartInstance = null;
let inactivityTimer;

// Costanti
const DELETE_TIMEOUT = 5 * 60 * 1000; // 5 minuti
const INACTIVITY_TIMEOUT = 30 * 60 * 1000; // 30 minuti

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
}

function setupEventListeners() {
    // Event listeners principali
    document.getElementById('loginForm')?.addEventListener('submit', handleLogin);
    document.getElementById('logoutButton')?.addEventListener('click', handleLogout);
    document.getElementById('toolForm')?.addEventListener('submit', handleToolSubmit);
    document.getElementById('module')?.addEventListener('change', validatePosition);
    document.getElementById('position')?.addEventListener('input', validatePosition);
    document.getElementById('failureReason')?.addEventListener('change', toggleOtherReason);
    
    // Event listeners per export/import
    document.getElementById('exportCSV')?.addEventListener('click', handleExport);
    document.getElementById('exportPDF')?.addEventListener('click', handleExportPDF);
    document.getElementById('importButton')?.addEventListener('click', handleImport);
    
    // Event listeners per filtri
    document.getElementById('applyFilters')?.addEventListener('click', handleFilterApply);
    document.getElementById('resetFilters')?.addEventListener('click', resetFilters);
}

// Gestione dell'inattività
function setupInactivityMonitoring() {
    ['mousemove', 'keypress', 'click', 'scroll'].forEach(event => {
        document.addEventListener(event, resetInactivityTimer);
    });
    resetInactivityTimer();
}

function resetInactivityTimer() {
    clearTimeout(inactivityTimer);
    if (currentUser) {
        inactivityTimer = setTimeout(handleLogout, INACTIVITY_TIMEOUT);
    }
}

// Funzioni di autenticazione
function handleLogin(e) {
    e.preventDefault();
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();

    const user = window.users.find(u => u.username === username && u.password === password);
    
    if (user) {
        currentUser = user;
        showAppropriateView();
        showNotification(`Benvenuto ${username}!`, 'success');
        resetInactivityTimer();
    } else {
        showNotification('Credenziali non valide', 'error');
    }
}

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
        initializeSupervisorDashboard();
    }

    determineShift();
    loadHistory();
    loadRecentHistory();
}

function handleLogout() {
    currentUser = null;
    clearTimeout(inactivityTimer);
    
    document.getElementById('appSection').style.display = 'none';
    document.getElementById('loginSection').style.display = 'block';
    document.getElementById('logoutButton').style.display = 'none';
    document.getElementById('operatorView').style.display = 'none';
    document.getElementById('supervisorView').style.display = 'none';
    
    document.getElementById('loginForm').reset();
    showNotification('Logout effettuato con successo', 'success');
}

// Gestione dell'orologio
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

// Gestione form mole
function handleToolSubmit(e) {
    e.preventDefault();
    if (!validatePosition()) return;

    const formData = getFormData();
    const newEntry = {
        ...formData,
        id: Date.now().toString(),
        operator: currentUser.username,
        timestamp: new Date().toISOString()
    };

    const history = getHistory();
    history.unshift(newEntry);
    saveHistory(history);

    document.getElementById('toolForm').reset();
    determineShift();
    loadHistory();
    loadRecentHistory();
    
    if (currentUser.role === 'supervisor') {
        refreshAllStats();
    }

    showNotification('Cambio registrato con successo', 'success');
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
    const module = document.getElementById('module').value;
    const position = parseInt(document.getElementById('position').value);
    const maxPosition = module === 'Modulo 1' ? 24 : module === 'Modulo 2' ? 18 : 0;
    const feedback = document.getElementById('positionFeedback');
    const input = document.getElementById('position');

    if (position < 1 || position > maxPosition) {
        input.classList.add('is-invalid');
        feedback.style.display = 'block';
        return false;
    }

    input.classList.remove('is-invalid');
    feedback.style.display = 'none';
    return true;
}

function toggleOtherReason() {
    const container = document.getElementById('otherReasonContainer');
    const otherReason = document.getElementById('otherReason');
    
    if (this.value === 'Altro') {
        container.style.display = 'block';
        otherReason.required = true;
    } else {
        container.style.display = 'none';
        otherReason.required = false;
        otherReason.value = '';
    }
}

// Gestione turni
function determineShift() {
    const now = new Date();
    const hour = now.getHours();
    let shift;

    if (hour >= 6 && hour < 14) {
        shift = 'Mattina';
    } else if (hour >= 14 && hour < 22) {
        shift = 'Pomeriggio';
    } else {
        shift = 'Notte';
    }

    document.getElementById('shift').value = shift;
}

// Gestione dello storage
function getHistory() {
    try {
        return JSON.parse(localStorage.getItem('toolHistory')) || [];
    } catch (error) {
        console.error('Errore nel recupero dello storico:', error);
        return [];
    }
}

function saveHistory(history) {
    try {
        localStorage.setItem('toolHistory', JSON.stringify(history));
        return true;
    } catch (error) {
        console.error('Errore nel salvataggio dello storico:', error);
        showNotification('Errore nel salvataggio dei dati', 'error');
        return false;
    }
}

// Gestione delle tabelle
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

function createHistoryRow(entry, isRecent = false) {
    const row = document.createElement('tr');
    const timeSinceCreation = Date.now() - new Date(entry.timestamp).getTime();
    const canDelete = currentUser?.role === 'supervisor' || 
                     (entry.operator === currentUser?.username && timeSinceCreation <= DELETE_TIMEOUT);

    let html = `
        <td>${entry.operator}</td>
        <td>${entry.module}</td>
        <td>${entry.position}</td>
        <td>${entry.grindingType}</td>
        <td>${entry.shift}</td>
        <td>${new Date(entry.timestamp).toLocaleString('it-IT')}</td>
    `;

    if (!isRecent) {
        html += `<td>${entry.failureReason}${entry.otherReason ? ` (${entry.otherReason})` : ''}</td>`;
    }

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
        saveHistory(history);
        loadHistory();
        loadRecentHistory();
        refreshAllStats();
        showNotification('Record eliminato con successo', 'success');
    } else {
        showNotification('Non hai i permessi per eliminare questo record', 'error');
    }
}

// Gestione dei filtri
function handleFilterApply() {
    const filters = getFilterValues();
    const history = getHistory();
    const filteredHistory = filterHistory(history, filters);
    updateHistoryTable(filteredHistory);
    document.querySelector('.filters-section')?.classList.add('filters-active');
}

function getFilterValues() {
    return {
        dateStart: document.getElementById('filterDateStart')?.value,
        dateEnd: document.getElementById('filterDateEnd')?.value,
        operator: document.getElementById('filterOperator')?.value,
        grindingType: document.getElementById('filterGrindingType')?.value
    };
}

function filterHistory(history, filters) {
    return history.filter(entry => {
        const entryDate = entry.timestamp.split('T')[0];
        return (!filters.dateStart || entryDate >= filters.dateStart) &&
               (!filters.dateEnd || entryDate <= filters.dateEnd) &&
               (!filters.operator || entry.operator === filters.operator) &&
               (!filters.grindingType || entry.grindingType === filters.grindingType);
    });
}

function updateHistoryTable(filteredHistory) {
    const tbody = document.getElementById('historyTable')?.querySelector('tbody');
    if (!tbody) return;

    tbody.innerHTML = '';
    filteredHistory.forEach(entry => {
        const row = createHistoryRow(entry);
        tbody.appendChild(row);
    });

    showNotification(`Trovati ${filteredHistory.length} risultati`, 'success');
}

function resetFilters() {
    const filterElements = ['filterDateStart', 'filterDateEnd', 'filterOperator', 'filterGrindingType'];
    filterElements.forEach(id => {
        const element = document.getElementById(id);
        if (element) element.value = '';
    });
    
    loadHistory();
    document.querySelector('.filters-section')?.classList.remove('filters-active');
    showNotification('Filtri resettati', 'success');
}

// Gestione Export/Import
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

function generateCSV(history) {
    const headers = ['Operatore', 'Modulo', 'Posizione', 'Tipo Mola', 'Turno', 'Data e Ora', 'Motivo', 'Dettagli'];
    const rows = history.map(entry => [
        entry.operator,
        entry.module,
        entry.position,
        entry.grindingType,
        entry.shift,
        new Date(entry.timestamp).toLocaleString('it-IT'),
        entry.failureReason,
        entry.otherReason || ''
    ].map(cell => `"${cell}"`).join(','));
    
    return [headers.join(','), ...rows].join('\n');
}

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
        const rows = text.split('\n');
        if (rows.length < 2) {
            throw new Error('File CSV non valido');
        }

        const importedData = parseCSVData(rows.slice(1));
        mergeAndSaveData(importedData);

        document.getElementById('importCSV').value = '';
        showNotification('Importazione completata con successo', 'success');
    } catch (error) {
        console.error('Errore durante l\'importazione:', error);
        showNotification('Errore durante l\'importazione. Verifica il formato del file.', 'error');
    } finally {
        hideLoadingOverlay();
    }
}

function parseCSVData(rows) {
    return rows.filter(row => row.trim()).map((row, index) => {
        const values = row.split(',').map(v => v.trim().replace(/^"(.*)"$/, '$1'));
        return {
            id: Date.now().toString() + index,
            operator: values[0],
            module: values[1],
            position: values[2],
            grindingType: values[3],
            shift: values[4],
            timestamp: new Date(values[5]).toISOString(),
            failureReason: values[6],
            otherReason: values[7] || ''
        };
    });
}

function mergeAndSaveData(importedData) {
    const existingData = getHistory();
    const mergedData = [...importedData, ...existingData];
    saveHistory(mergedData);
    loadHistory();
    loadRecentHistory();
    refreshAllStats();
}

// Funzioni Dashboard Supervisore
function initializeSupervisorDashboard() {
    updateStatistics();
    setupCharts();
    populateFilters();
    updateTopOperators();
}

function refreshAllStats() {
    if (!currentUser || currentUser.role !== 'supervisor') return;

    try {
        showLoadingOverlay();
        updateStatistics();
        updateTopOperators();
        setupCharts();
        populateFilters();
        showNotification('Statistiche aggiornate con successo', 'success');
    } catch (error) {
        console.error('Errore nell\'aggiornamento delle statistiche:', error);
        showNotification('Errore nell\'aggiornamento delle statistiche', 'error');
    } finally {
        hideLoadingOverlay();
    }
}

function updateStatistics() {
    const history = getHistory();
    const today = new Date().toISOString().split('T')[0];
    
    // Statistiche del giorno
    const todayChanges = history.filter(h => h.timestamp.startsWith(today)).length;
    document.getElementById('todayChanges').textContent = todayChanges;

    // Statistiche della settimana
    const weekStart = new Date();
    weekStart.setDate(weekStart.getDate() - 7);
    const weekChanges = history.filter(h => new Date(h.timestamp) >= weekStart).length;
    document.getElementById('weekChanges').textContent = weekChanges;

    // Mole difettose
    const defectiveCount = history.filter(h => h.failureReason === 'Difetto').length;
    document.getElementById('defectiveCount').textContent = defectiveCount;

    // Media giornaliera
    const dailyAverage = Math.round(weekChanges / 7);
    document.getElementById('dailyAverage').textContent = dailyAverage;
}

function setupCharts() {
    setupWeeklyChart();
    setupGrindingTypeChart();
}

function setupWeeklyChart() {
    const ctx = document.getElementById('weeklyChart')?.getContext('2d');
    if (!ctx) return;

    const history = getHistory();
    const lastWeek = new Date();
    lastWeek.setDate(lastWeek.getDate() - 7);

    const dailyData = Array(7).fill(0);
    const labels = Array(7).fill().map((_, i) => {
        const date = new Date();
        date.setDate(date.getDate() - i);
        return date.toLocaleDateString('it-IT', { weekday: 'short', day: 'numeric' });
    }).reverse();

    history.forEach(entry => {
        const entryDate = new Date(entry.timestamp);
        if (entryDate >= lastWeek) {
            const dayIndex = 6 - Math.floor((Date.now() - entryDate) / (1000 * 60 * 60 * 24));
            if (dayIndex >= 0 && dayIndex < 7) {
                dailyData[dayIndex]++;
            }
        }
    });

    if (weeklyChartInstance) {
        weeklyChartInstance.destroy();
    }

    weeklyChartInstance = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Cambi Giornalieri',
                data: dailyData,
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
                    ticks: {
                        stepSize: 1
                    }
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

function setupGrindingTypeChart() {
    const ctx = document.getElementById('grindingTypeChart')?.getContext('2d');
    if (!ctx) return;

    const history = getHistory();
    const typeCount = {};
    
    history.forEach(entry => {
        typeCount[entry.grindingType] = (typeCount[entry.grindingType] || 0) + 1;
    });

    if (grindingTypeChartInstance) {
        grindingTypeChartInstance.destroy();
    }

    grindingTypeChartInstance = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: Object.keys(typeCount),
            datasets: [{
                data: Object.values(typeCount),
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
                legend: {
                    position: 'right'
                },
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
        if (!operatorStats[entry.operator]) {
            operatorStats[entry.operator] = 0;
        }
        operatorStats[entry.operator]++;
    });

    const sortedOperators = Object.entries(operatorStats)
        .sort(([, a], [, b]) => b - a)
        .slice(0, 3);

    const topOperatorsContainer = document.getElementById('topOperators');
    if (!topOperatorsContainer) return;

    topOperatorsContainer.innerHTML = '';

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
        topOperatorsContainer.appendChild(col);
    });
}

function populateFilters() {
    const history = getHistory();
    
    // Popola operatori
    const operators = [...new Set(history.map(h => h.operator))];
    const operatorSelect = document.getElementById('filterOperator');
    if (operatorSelect) {
        operatorSelect.innerHTML = '<option value="">Tutti</option>' + 
            operators.map(op => `<option value="${op}">${op}</option>`).join('');
    }

    // Popola tipi di mola
    const types = [...new Set(history.map(h => h.grindingType))];
    const typeSelect = document.getElementById('filterGrindingType');
    if (typeSelect) {
        typeSelect.innerHTML = '<option value="">Tutti</option>' + 
            types.map(type => `<option value="${type}">${type}</option>`).join('');
    }
}

// Funzioni di utilità
function showLoadingOverlay() {
    const overlay = document.getElementById('loadingOverlay');
    if (overlay) overlay.classList.add('active');
}

function hideLoadingOverlay() {
    const overlay = document.getElementById('loadingOverlay');
    if (overlay) overlay.classList.remove('active');
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
        if (!operatorStats[entry.operator]) {
            operatorStats[entry.operator] = 0;
        }
        operatorStats[entry.operator]++;
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

// Rendere le funzioni disponibili globalmente
window.handleDelete = handleDelete;
window.handleFilterApply = handleFilterApply;
window.handleExport = handleExport;
window.handleImport = handleImport;
window.handleExportPDF = handleExportPDF;
window.resetFilters = resetFilters;
window.refreshAllStats = refreshAllStats;