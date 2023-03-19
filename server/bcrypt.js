const bcrypt = require('bcrypt');
const db = require('./db');

const createUser = async (
  username,
  password,
  email,
  firstName,
  lastName,
  phoneNumber
) => {
  const saltRounds = 10;
  const hashedPassword = await bcrypt.hash(password, saltRounds);
  const queryText = `INSERT INTO Users(username, password, email, first_name, last_name, phone_number) VALUES($1, $2, $3, $4, $5, $6) RETURNING *`;
  const values = [
    username,
    hashedPassword,
    email,
    firstName,
    lastName,
    phoneNumber,
  ];
  const res = await db.query(queryText, values);
  return res.rows[0];
};

const compareUser = async (username, password) => {
  const queryText = `SELECT * FROM Users WHERE username=$1`;
  const values = [username];
  const res = await db.query(queryText, values);
  if (res.rows.length > 0) {
    const match = await bcrypt.compare(password, res.rows[0].password);
    if (match) {
      return res.rows[0];
    } else {
      throw new Error('Invalid Password');
    }
  } else {
    throw new Error('User Not Found');
  }
};

module.exports = { createUser, compareUser };
