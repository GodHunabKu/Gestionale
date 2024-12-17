// grinding-machines.js
const GRINDING_MACHINES = {
    dry: {
        machines: ['0', '3', '4', '5'],
        suppliers: ['Surface', 'Tecnodiamant'],
        wheels: ['RK1', 'RK2', 'SAETTA50/1', 'SAETTA20/1', 'BISELLINO']
    },
    wet: {
        machines: ['1', '2'],
        suppliers: ['Surface', 'Tecnodiamant'],
        wheels: ['MOLA UMIDO 1', 'MOLA UMIDO 2', 'MOLA UMIDO 3']
    }
};

const MACHINE_POSITIONS = {
    '0': 24,
    '1': 18,
    '2': 18,
    '3': 24,
    '4': 24,
    '5': 24
};

// Esporta le configurazioni
window.GRINDING_MACHINES = GRINDING_MACHINES;
window.MACHINE_POSITIONS = MACHINE_POSITIONS;