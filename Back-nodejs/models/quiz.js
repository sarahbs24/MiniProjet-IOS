const mongoose = require('mongoose');

const quizSchema = new mongoose.Schema({
  coursId: { type: mongoose.Schema.Types.ObjectId, ref: 'Cours' },
  topScore: String,
  time: String,
});

const Quiz = mongoose.model('Quiz', quizSchema);

module.exports = Quiz;