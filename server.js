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

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'Sassprod1',
  database: 'gestionale_mole',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

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
  debug: true
});

async function sendEmail(operationDetails) {
  try {
    let subject = operationDetails.tipo === 'cambioMola' ? "Nuova Mola Registrata" : "Nuovo Bisello Registrato";
    let text = `Una nuova operazione è stata registrata:
             Tipo: ${operationDetails.tipo}
             Macchina: ${operationDetails.macchina}
             Posizione: ${operationDetails.posizione}
             Tipo Specifico: ${operationDetails.tipoSpecifico}
             Operatore: ${operationDetails.operatore}
             Turno: ${operationDetails.turno}
             Modulo: ${operationDetails.modulo}`;

    let info = await transporter.sendMail({
      from: `"Sistema Gestionale Mole" <${process.env.EMAIL_USER}>`,
      to: "metalrambo95@hotmail.it",
      subject: subject,
      text: text
    });
    console.log('Email inviata con successo. ID messaggio:', info.messageId);
    return true;
  } catch (error) {
    console.error('Errore nell\'invio dell\'email:', error);
    throw error;
  }
}

app.post('/registra-operazione', async (req, res) => {
  const { macchina, posizione, tipo, tipoSpecifico, operatore, turno, modulo } = req.body;
  
  console.log('Ricevuta richiesta di registrazione operazione:', req.body);

  try {
    const [result] = await pool.execute(
      'INSERT INTO operazioni (data, macchina, posizione, tipo, tipoSpecifico, operatore, turno, modulo) VALUES (NOW(), ?, ?, ?, ?, ?, ?, ?)',
      [macchina, posizione, tipo, tipoSpecifico, operatore, turno, modulo]
    );
    
    console.log('Operazione inserita nel database con ID:', result.insertId);

    if (tipo === 'cambioMola' || tipo === 'cambioBisello') {
      console.log(`Tentativo di invio email per ${tipo}`);
      try {
        await sendEmail(req.body);
        console.log('Email inviata con successo');
      } catch (emailError) {
        console.error('Errore nell\'invio dell\'email:', emailError);
      }
    } else {
      console.log('Tipo di operazione non riconosciuto, email non inviata');
    }
    
    res.status(200).json({ message: 'Operazione registrata con successo', id: result.insertId });
  } catch (error) {
    console.error('Errore durante la registrazione dell\'operazione:', error);
    res.status(500).json({ message: 'Errore durante la registrazione dell\'operazione', error: error.message });
  }
});

app.get('/ultime-operazioni/:macchina?', async (req, res) => {
  try {
    let query = 'SELECT * FROM operazioni';
    let params = [];
    
    if (req.params.macchina) {
      query += ' WHERE macchina = ?';
      params.push(req.params.macchina);
    }
    
    query += ' ORDER BY data DESC LIMIT 10';
    
    const [rows] = await pool.query(query, params);
    res.status(200).json(rows);
  } catch (error) {
    console.error('Errore durante il recupero delle ultime operazioni:', error);
    res.status(500).json({ message: 'Errore durante il recupero delle ultime operazioni' });
  }
});

app.listen(port, () => {
  console.log(`Server in ascolto sulla porta ${port}`);
});