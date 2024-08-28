const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const cors = require('cors');
const nodemailer = require('nodemailer');
const path = require('path');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public')));

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root', // Sostituisci con il tuo username MySQL
    password: 'Sassprod1', // Sostituisci con la tua password MySQL
    database: 'gestionale_mole'
});

connection.connect(err => {
    if (err) {
        console.error('Errore di connessione al database:', err);
        return;
    }
    console.log('Connesso al database MySQL');
    initDatabase();
});

const transporter = nodemailer.createTransport({
    host: process.env.EMAIL_HOST,
    port: process.env.EMAIL_PORT,
    secure: false,
    auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS
    }
});

function initDatabase() {
    const createTableQuery = `
        CREATE TABLE IF NOT EXISTS operazioni (
            id INT AUTO_INCREMENT PRIMARY KEY,
            data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            macchina VARCHAR(50),
            posizione VARCHAR(50),
            tipo VARCHAR(50),
            tipoSpecifico VARCHAR(100),
            operatore VARCHAR(100),
            turno VARCHAR(50),
            modulo VARCHAR(50)
        )
    `;
    connection.query(createTableQuery, (err) => {
        if (err) {
            console.error('Errore durante la creazione della tabella:', err);
        } else {
            console.log('Tabella operazioni creata o già esistente');
        }
    });
}

async function sendEmail(operationDetails) {
    const subject = operationDetails.tipo === 'cambioMola' ? "Nuova Mola Registrata" : "Nuovo Bisello Registrato";
    const text = `Una nuova operazione è stata registrata:
        Tipo: ${operationDetails.tipo}
        Macchina: ${operationDetails.macchina}
        Posizione: ${operationDetails.posizione}
        Tipo Specifico: ${operationDetails.tipoSpecifico}
        Operatore: ${operationDetails.operatore}
        Turno: ${operationDetails.turno}
        Modulo: ${operationDetails.modulo}`;

    try {
        const info = await transporter.sendMail({
            from: `"Sistema Gestionale Mole" <${process.env.EMAIL_USER}>`,
            to: "metalrambo95@hotmail.it",
            subject,
            text
        });
        console.log('Email inviata con successo. ID messaggio:', info.messageId);
        return true;
    } catch (error) {
        console.error('Errore nell\'invio dell\'email:', error);
        throw error;
    }
}

app.post('/registra-operazione', (req, res) => {
    const { macchina, posizione, tipo, tipoSpecifico, operatore, turno, modulo } = req.body;
    console.log('Ricevuta richiesta di registrazione operazione:', req.body);

    const query = 'INSERT INTO operazioni (macchina, posizione, tipo, tipoSpecifico, operatore, turno, modulo) VALUES (?, ?, ?, ?, ?, ?, ?)';
    connection.query(query, [macchina, posizione, tipo, tipoSpecifico, operatore, turno, modulo], (err, result) => {
        if (err) {
            console.error('Errore durante la registrazione dell\'operazione:', err);
            res.status(500).json({ message: 'Errore durante la registrazione dell\'operazione', error: err.message });
            return;
        }
        
        console.log('Operazione inserita nel database con ID:', result.insertId);

        if (tipo === 'cambioMola' || tipo === 'cambioBisello') {
            sendEmail(req.body).catch(emailError => {
                console.error('Errore nell\'invio dell\'email:', emailError);
            });
        }
        
        res.status(200).json({ message: 'Operazione registrata con successo', id: result.insertId });
    });
});

app.get('/ultime-operazioni/:macchina?', (req, res) => {
    let query = 'SELECT * FROM operazioni';
    let params = [];
    
    if (req.params.macchina) {
        query += ' WHERE macchina = ?';
        params.push(req.params.macchina);
    }
    
    query += ' ORDER BY data DESC LIMIT 10';
    
    connection.query(query, params, (err, rows) => {
        if (err) {
            console.error('Errore durante il recupero delle ultime operazioni:', err);
            res.status(500).json({ message: 'Errore durante il recupero delle ultime operazioni' });
            return;
        }
        res.status(200).json(rows);
    });
});

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.get('/test', (req, res) => {
    res.send('Il server funziona!');
});

app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).send('Qualcosa è andato storto!');
});

app.listen(port, '0.0.0.0', () => {
    console.log(`Server in ascolto su http://0.0.0.0:${port}`);
});

process.on('SIGTERM', () => {
    console.info('SIGTERM signal received.');
    console.log('Closing http server.');
    server.close(() => {
        console.log('Http server closed.');
        connection.end(() => {
            console.log('Database connection closed.');
            process.exit(0);
        });
    });
});