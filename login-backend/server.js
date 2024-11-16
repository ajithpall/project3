const express = require('express');
const mysql = require('mysql2/promise');
const bcrypt = require('bcrypt');
const bodyParser = require('body-parser');
const dotenv = require('dotenv');

dotenv.config();
const app = express();
app.use(bodyParser.json());

let db;

async function connectToDatabase() {
  try {
    db = await mysql.createConnection({
      host: process.env.DB_HOST,
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME
    });
    console.log('Connected to database');

    // Call setupDatabase after successful connection
    await setupDatabase();

  } catch (err) {
    console.error('Error connecting to the database:', err);
    process.exit(1);
  }
}

// Create table if not exists and insert demo data
async function setupDatabase() {
  try {
    const createTableQuery = `
      CREATE TABLE IF NOT EXISTS userprofile (
        ID INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(20) NOT NULL,
        password VARCHAR(255) NOT NULL,
        emailOrPhone VARCHAR(100) NOT NULL,
        profilePhoto VARCHAR(255),
        address TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    `;
    await db.query(createTableQuery);
    console.log('Table created or already exists');

    const insertDemoDataQuery = `
      INSERT INTO userprofile (username, password, emailOrPhone, profilePhoto, address)
      VALUES ('demo_user', 'demo_password', 'demo@example.com', NULL, NULL)
    `;
    await db.query(insertDemoDataQuery);
    console.log('Demo data inserted successfully');

  } catch (err) {
    console.error('Error setting up the database:', err);
  }
}

// Connect to the database when server starts
connectToDatabase();

// Simple endpoint to check server status
app.get('/Register', (req, res) => {
  res.send('Server is running');
});

// Register Endpoint
app.post('/Register', async (req, res) => {
  const { username, emailOrPhone, password } = req.body;

  try {
    // Check if username or email already exists
    const [results] = await db.query('SELECT * FROM userprofile WHERE username = ? OR emailOrPhone = ?', [username, emailOrPhone]);
    if (results.length > 0) {
      return res.status(409).json({ message: 'User already exists' });
    }

    // Hash password before storing it
    const hashedPassword = await bcrypt.hash(password, 10);

    // Insert new user
    const [result] = await db.query(
      'INSERT INTO userprofile (username, emailOrPhone, password) VALUES (?, ?, ?)',
      [username, emailOrPhone, hashedPassword]
    );
    res.status(200).json({ message: 'User registered successfully', userId: result.insertId });
  } catch (err) {
    console.error('Error registering user:', err);
    res.status(500).json({ message: 'Error registering user' });
  }
});

// Endpoint to get registered users
app.get('/users', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT ID, username, emailOrPhone, profilePhoto, address, created_at FROM userprofile');
    res.status(200).json(rows);
  } catch (err) {
    console.error('Error retrieving users:', err);
    res.status(500).json({ message: 'Error retrieving users' });
  }
});

// Start the server
app.listen(3000, () => console.log('Server running on port 3000'));
