// Configurazione iniziale degli utenti
const DEFAULT_USERS = {
    operators: [
        { username: "rinor", password: "1", role: "operator" },
        { username: "mattia", password: "1", role: "operator" },
		{ username: "davide", password: "1", role: "operator" },
		{ username: "oreste", password: "1", role: "operator" },
		{ username: "stefano", password: "1", role: "operator" },
		{ username: "giancarlo", password: "1", role: "operator" },
		{ username: "salah", password: "1", role: "operator" },
		{ username: "brahim", password: "1", role: "operator" },
		{ username: "vincenzo", password: "1", role: "operator" },
		{ username: "giuseppe", password: "1", role: "operator" },
		{ username: "mirko", password: "1", role: "operator" }
		
    ],
    supervisors: [
        { username: "aragona", password: "1", role: "supervisor" }
    ]
};

// Funzione per caricare gli utenti da localStorage
function loadUsersFromLocalStorage() {
    try {
        const storedUsers = localStorage.getItem('users');
        if (!storedUsers) {
            // Prima inizializzazione
            const users = [...DEFAULT_USERS.operators, ...DEFAULT_USERS.supervisors];
            localStorage.setItem('users', JSON.stringify(users));
            return users;
        }
        return JSON.parse(storedUsers);
    } catch (error) {
        console.error('Errore nel caricamento utenti:', error);
        return [...DEFAULT_USERS.operators, ...DEFAULT_USERS.supervisors];
    }
}

// Funzione per salvare gli utenti
function saveUsers(users) {
    try {
        localStorage.setItem('users', JSON.stringify(users));
        return true;
    } catch (error) {
        console.error('Errore nel salvataggio utenti:', error);
        return false;
    }
}

// Funzione per aggiungere un nuovo utente
function addUser(username, password, role) {
    const users = loadUsersFromLocalStorage();
    if (users.some(u => u.username === username)) {
        return false; // Username già esistente
    }
    
    users.push({ username, password, role });
    return saveUsers(users);
}

// Funzione per rimuovere un utente
function removeUser(username) {
    const users = loadUsersFromLocalStorage();
    const newUsers = users.filter(u => u.username !== username);
    return saveUsers(newUsers);
}

// Funzione per modificare la password di un utente
function changePassword(username, newPassword) {
    const users = loadUsersFromLocalStorage();
    const user = users.find(u => u.username === username);
    if (!user) return false;
    
    user.password = newPassword;
    return saveUsers(users);
}

// Rendere le funzioni disponibili globalmente
window.loadUsersFromLocalStorage = loadUsersFromLocalStorage;
window.addUser = addUser;
window.removeUser = removeUser;
window.changePassword = changePassword;