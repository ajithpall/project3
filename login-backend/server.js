const express = require('express');
const mysql = require('mysql');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const bodyParser = require('body-parser');
const dotenv = require('dotenv');

dotenv.config();
const app = express();
app.use(bodyParser.json());

// SQL Database Connection
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

db.connect((err) => {
    if (err) throw err;
    console.log('Connected to database');
});

// Register Endpoint
app.post('/register', async (req, res) => {
    const { username, emailOrPhone, password } = req.body;

    // Check if username or email already exists
    db.query('SELECT * FROM users WHERE username = ? OR emailOrPhone = ?', [username, emailOrPhone], async (err, results) => {
        if (results.length > 0) {
            return res.status(409).json({ message: 'User already exists' });
        }

        // Hash password before storing it
        const hashedPassword = await bcrypt.hash(password, 10);

        // Insert new user
        db.query(
            'INSERT INTO users (username, emailOrPhone, password) VALUES (?, ?, ?)',
            [username, emailOrPhone, hashedPassword],
            (err, result) => {
                if (err) {
                    return res.status(500).json({ message: 'Error registering user' });
                }
                res.status(200).json({ message: 'User registered successfully' });
            }
        );
    });
});

// Start the server
app.listen(3000, () => console.log('Server running on port 3000'));
