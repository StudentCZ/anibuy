const { Pool } = require('pg');
require('dotenv').config({ path: '../.env' });

const db = new Pool({
  user: '',
  password: '',
  host: '',
  port: '',
  database: '',
});

module.exports = db;
