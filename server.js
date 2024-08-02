const express = require('express');
const mysql = require('mysql2/promise');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());

// Configurazione del pool di connessioni MySQL
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root', // Sostituisci con il tuo username MySQL
  password: 'Sassprod1', // Sostituisci con la tua password MySQL
  database: 'gestionale_mole',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

app.post('/registra-operazione', async (req, res) => {
  const { macchina, posizione, tipo, tipoSpecifico, operatore, turno } = req.body;
  
  try {
    const [result] = await pool.execute(
      'INSERT INTO operazioni (data, macchina, posizione, tipo, tipoSpecifico, operatore, turno) VALUES (NOW(), ?, ?, ?, ?, ?, ?)',
      [macchina, posizione, tipo, tipoSpecifico, operatore, turno]
    );
    
    res.status(200).json({ message: 'Operazione registrata con successo', id: result.insertId });
  } catch (error) {
    console.error('Errore durante la registrazione dell\'operazione:', error);
    res.status(500).json({ message: 'Errore durante la registrazione dell\'operazione' });
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

app.post('/registra-operazione', async (req, res) => {
  const { macchina, posizione, tipo, tipoSpecifico, operatore, turno } = req.body;
  
  console.log('Dati ricevuti:', req.body);
  
  try {
    const [result] = await pool.execute(
      'INSERT INTO operazioni (data, macchina, posizione, tipo, tipoSpecifico, operatore, turno) VALUES (NOW(), ?, ?, ?, ?, ?, ?)',
      [macchina, posizione, tipo, tipoSpecifico, operatore, turno]
    );
    
    res.status(200).json({ message: 'Operazione registrata con successo', id: result.insertId });
  } catch (error) {
    console.error('Errore durante la registrazione dell\'operazione:', error);
    res.status(500).json({ message: 'Errore durante la registrazione dell\'operazione', error: error.message });
  }
});