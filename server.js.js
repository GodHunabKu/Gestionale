const express = require('express');
const bodyParser = require('body-parser');
const nodemailer = require('nodemailer');
const path = require('path');

const app = express();
const port = 3000;

// Middleware
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname)));

// Configurazione email
const emailConfig = {
    host: 'smtp.gmail.com',
    port: 587,
    user: 'cambiomolemarlit@gmail.com',
    pass: 'xkng oqpp ufqh uogp'
};

// Endpoint per l'invio delle email
app.post('/api/send-backup', async (req, res) => {
    try {
        const { subject, text, attachment } = req.body;
        
        const transporter = nodemailer.createTransport({
            host: emailConfig.host,
            port: emailConfig.port,
            secure: false,
            auth: {
                user: emailConfig.user,
                pass: emailConfig.pass
            }
        });

        const mailOptions = {
            from: emailConfig.user,
            to: emailConfig.user,
            subject: subject,
            text: text,
            attachments: [{
                filename: attachment.filename,
                content: attachment.content
            }]
        };

        await transporter.sendMail(mailOptions);
        res.status(200).json({ message: 'Email inviata con successo' });
    } catch (error) {
        console.error('Errore nell\'invio dell\'email:', error);
        res.status(500).json({ error: 'Errore nell\'invio dell\'email' });
    }
});

app.listen(port, () => {
    console.log(`Server avviato sulla porta ${port}`);
});