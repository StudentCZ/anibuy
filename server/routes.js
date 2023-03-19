const express = require('express');
const router = express.Router();
const db = require('./db');

router.use(express.json());

router.get('/users', async (req, res) => {
  try {
    const result = await db.query(
      `SELECT user_id, username, email, first_name, last_name, phone_number, created_at, updated_at FROM Users`
    );
    res.status(200).json(result.rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).json({ error: 'Server Error' });
  }
});

router.get('/products', async (req, res) => {
  try {
    const result = await db.query(`SELECT * FROM Products`);
    res.status(200).json(result.rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).json({ error: 'Server Error' });
  }
});

router.get('/categories', async (req, res) => {
  try {
    const result = await db.query(`SELECT * FROM Categories`);
    res.status(200).json(result.rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).json({ error: 'Server Error' });
  }
});

module.exports = router;
