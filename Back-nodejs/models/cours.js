const mongoose = require('mongoose');

const coursSchema = new mongoose.Schema({
  id: String,
  titleImage:String,
  title: String,
  header: String,
  favori: Boolean,
});

let Cours = mongoose.model('Cours', coursSchema);

module.exports = Cours;