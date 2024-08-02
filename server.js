const express = require('express');
const mysql = require('mysql2/promise');
const bodyParser = require('body-parser');
const cors = require('cors');
require('dotenv').config();
const nodemailer = require('nodemailer');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());

// Configurazione del pool di connessioni MySQL
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'Sassprod1',
  database: 'gestionale_mole',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

require('dotenv').config();

console.log('Variabili d\'ambiente:');
console.log('EMAIL_HOST:', process.env.EMAIL_HOST);
console.log('EMAIL_PORT:', process.env.EMAIL_PORT);
console.log('EMAIL_USER:', process.env.EMAIL_USER);
console.log('EMAIL_PASS:', process.env.EMAIL_PASS ? '********' : 'non impostata');

let transporter = nodemailer.createTransport({
  host: process.env.EMAIL_HOST,
  port: process.env.EMAIL_PORT,
  secure: false,
  auth: {
    user: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASS
  },
  tls: {
    rejectUnauthorized: false
  },
  logger: true,
  debug: true // abilita la modalità di debug
});

async function sendEmail(operationDetails) {
  try {
    let info = await transporter.sendMail({
      from: `"Sistema Gestionale Mole" <${process.env.EMAIL_USER}>`,
      to: "metalrambo95@hotmail.it", // Assicurati che questo sia un indirizzo email valido
      subject: "Nuova Mola Registrata",
      text: `Una nuova mola è stata registrata:
             Macchina: ${operationDetails.macchina}
             Posizione: ${operationDetails.posizione}
             Tipo: ${operationDetails.tipoSpecifico}
             Operatore: ${operationDetails.operatore}
             Turno: ${operationDetails.turno}`
    });
    console.log('Email inviata con successo. ID messaggio:', info.messageId);
    return true;
  } catch (error) {
    console.error('Errore nell\'invio dell\'email:', error);
    return false;
  }
}

app.post('/registra-operazione', async (req, res) => {
  const { macchina, posizione, tipo, tipoSpecifico, operatore, turno } = req.body;
  
  console.log('Ricevuta richiesta di registrazione operazione:', req.body);

  try {
    const [result] = await pool.execute(
      'INSERT INTO operazioni (data, macchina, posizione, tipo, tipoSpecifico, operatore, turno) VALUES (NOW(), ?, ?, ?, ?, ?, ?)',
      [macchina, posizione, tipo, tipoSpecifico, operatore, turno]
    );
    
    console.log('Operazione inserita nel database con ID:', result.insertId);

    // Invia l'email dopo aver registrato l'operazione
    if (tipo === 'cambioMola') {
      console.log('Tentativo di invio email per cambio mola');
      const emailSent = await sendEmail(req.body);
      console.log('Stato invio email:', emailSent ? 'Inviata' : 'Non inviata');
    } else {
      console.log('Operazione non è un cambio mola, email non inviata');
    }
    
    res.status(200).json({ message: 'Operazione registrata con successo', id: result.insertId });
  } catch (error) {
    console.error('Errore durante la registrazione dell\'operazione:', error);
    res.status(500).json({ message: 'Errore durante la registrazione dell\'operazione', error: error.message });
  }
});

app.get('/ultime-operazioni', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM operazioni ORDER BY data DESC LIMIT 10');
    res.status(200).json(rows);
  } catch (error) {
    console.error('Errore durante il recupero delle ultime operazioni:', error);
    res.status(500).json({ message: 'Errore durante il recupero delle ultime operazioni' });
  }
});

app.listen(port, () => {
  console.log(`Server in ascolto sulla porta ${port}`);
});

app.get('/test-email', async (req, res) => {
  try {
    const testData = {
      macchina: 'Test Machine',
      posizione: 'Test Position',
      tipoSpecifico: 'Test Type',
      operatore: 'Test Operator',
      turno: 'Test Shift'
    };
    const emailSent = await sendEmail(testData);
    res.json({ success: emailSent, message: emailSent ? 'Email inviata con successo' : 'Invio email fallito' });
  } catch (error) {
    console.error('Errore nel test di invio email:', error);
    res.status(500).json({ success: false, error: error.message });
  }
});