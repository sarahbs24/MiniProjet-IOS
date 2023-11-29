const mongoose = require('mongoose');

const tokenSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
  tokens: Number,
});

const Token = mongoose.model('Token', tokenSchema);

module.exports = Token;