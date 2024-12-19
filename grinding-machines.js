const GRINDING_MACHINES = {
    dry: {
        machines: ['0', '3', '4', '5'],
        wheels: ['RK1', 'RK2', 'SAETTA50/1', 'SAETTA20/1']
    },
    wet: {
        machines: ['1', '2'],
        wheels: ['MOLA UMIDO 1', 'MOLA UMIDO 2', 'MOLA UMIDO 3']
    },
    modules: {
        'Modulo 1': {
            motors: 24,
            bevels: {
                operator: {start: 25, end: 25},
                nonOperator: {start: 26, end: 26}
            }
        },
        'Modulo 2': {
            motors: 18,
            bevels: {
                operator: {start: 19, end: 19},
                nonOperator: {start: 20, end: 20}
            }
        }
    }
};

// Definizione delle posizioni massime per ogni rettifica
const MACHINE_POSITIONS = {
    '0': 26, // Modulo 1: 24 motori + 2 biselli
    '1': 20, // Modulo 2: 18 motori + 2 biselli
    '2': 20, // Modulo 2: 18 motori + 2 biselli
    '3': 26, // Modulo 1: 24 motori + 2 biselli
    '4': 26, // Modulo 1: 24 motori + 2 biselli
    '5': 26  // Modulo 1: 24 motori + 2 biselli
};

// Esporta le configurazioni
window.GRINDING_MACHINES = GRINDING_MACHINES;
window.MACHINE_POSITIONS = MACHINE_POSITIONS;