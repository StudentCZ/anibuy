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
  const response = await db.query(queryText, values);
  return response.rows[0];
};

module.exports = { createUser };
