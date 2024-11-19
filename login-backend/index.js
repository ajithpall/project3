const express = require('express'); // import express library
const mysql = require('mysql2/promise'); // import mysql2 with promise support
const bcrypt = require('bcrypt'); // import bcrypt for password hashing
const bodyParser = require('body-parser'); // import body-parser for parsing JSON requests
const dotenv = require('dotenv'); // import dotenv for environment variables
const cors = require('cors'); // import cors for cross-origin resource sharing


dotenv.config(); // load environment variables from a .env file

const app = express(); // create an instance of the express app
app.use(cors()); // enable cross-origin resource sharing
app.use(bodyParser.json()); // use body-parser to parse JSON data

let db; // declare a variable to hold the database connection

// connectToDatabase function connects to the database using MySQL2 and the credentials from environment variables
async function connectToDatabase() {
  try {
    db = await mysql.createConnection({
      host: process.env.DB_HOST, // database host
      user: process.env.DB_USER, // database user
      password: process.env.DB_PASSWORD, // database password
      database: process.env.DB_NAME // database name
    });
    console.log('Connected to database'); // log successful database connection

    // Call setupDatabase after successful connection
    await setupDatabase(); // call setupDatabase to create the table and insert demo data

  } catch (err) {
    console.error('Error connecting to the database:', err); // log connection error
    process.exit(1); // exit the process if database connection fails
  }
}

// setupDatabase function creates a user table if it doesn't exist and inserts demo data
async function setupDatabase() {
  try {
    const createTableQuery = `
      CREATE TABLE IF NOT EXISTS user (
        ID INT AUTO_INCREMENT PRIMARY KEY, -- unique ID for each user
        username VARCHAR(20) NOT NULL, -- username of the user
        password VARCHAR(255) NOT NULL, -- hashed password of the user
        emailOrPhone VARCHAR(100) NOT NULL, -- email or phone of the user
        profilePhoto VARCHAR(255), -- optional profile photo of the user
        address TEXT, -- optional address of the user
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- timestamp of user creation
      )
    `;
    await db.query(createTableQuery); // execute the query to create the table
    console.log('Table created or already exists'); // log table creation success

//    const hashedPassword = await bcrypt.hash('demoPassword', 10); // hash the demo password
//    const insertDemoDataQuery = `
//      INSERT IGNORE INTO user (username, password, emailOrPhone, profilePhoto, address)
//      VALUES ('demoUser', ?, 'demoEmailOrPhone', NULL, NULL)
//    `;
//    await db.query(insertDemoDataQuery, [hashedPassword]); // insert demo data with hashed password
//    console.log('Demo data inserted successfully'); // log successful data insertion

  } catch (err) {
    console.error('Error setting up the database:', err); // log any error in setting up the database
  }
}

// Connect to the database when the server starts
connectToDatabase();

// Simple endpoint to check server status
app.get('/registerUser', (req, res) => {
  res.send('Server is running'); // respond with a simple message
});

// Register Endpoint
app.post('/registerUser'), async (req, res) => {
  const { username, emailOrPhone, password } = req.body; // destructure data from request body
// try to check
  try {
    // Check if username or email already exists
    const [results] = await db.query('SELECT * FROM user WHERE username = ? OR emailOrPhone = ?', [username, emailOrPhone]);
    if (results.length > 0) {
      return res.status(409).json({ message: 'User already exists' }); // respond with conflict status if user exists
    }

    // Hash password before storing it
    const hashedPassword = await bcrypt.hash(password, 10);

    // Insert new user
    const [result] = await db.query(
      'INSERT INTO user (username, emailOrPhone, password) VALUES (?, ?, ?)',
      [username, emailOrPhone, hashedPassword]
    );
    res.status(200).json({ message: 'User registered successfully', userId: result.insertId }); // respond with success message

  } catch (err) {
    console.error('Error registering user:', err); // log any error during registration
    res.status(500).json({ message: 'Error registering user' }); // respond with internal server error status
  }
};

// Endpoint to get registered users
app.get('/', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT ID, username, emailOrPhone, profilePhoto, address, created_at FROM user');
    res.status(200).json(rows); // respond with the list of users
  } catch (err) {
    console.error('Error retrieving users:', err); // log any error while retrieving users
    res.status(500).json({ message: 'Error retrieving users' }); // respond with internal server error status
  }
});

// Start the server
app.listen(3001, () => console.log('Server running on port 3001')); // log server start with port number
