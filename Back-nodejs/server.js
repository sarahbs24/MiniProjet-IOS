const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

// Créez une instance d'Express
const app = express();
const port = 3000;

// Utilisez le middleware bodyParser pour traiter les données JSON dans les requêtes
app.use(bodyParser.json());

// Connectez-vous à la base de données MongoDB
mongoose.connect('mongodb+srv://bensalemsarra:vxRSE3oGZzniddCR@cluster0.unlgdx2.mongodb.net/cours?retryWrites=true&w=majority', { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log('Connected to MongoDB');
  })
  .catch((err) => {
    console.error('Error connecting to MongoDB:', err);
  });

// Importez et utilisez les routes pour les détails des cours, les questions du quiz et les jetons des utilisateurs
const courseRoutes = require('./Routes/coursRoutes');
const quizRoutes   = require('./Routes/quizRoutes');
const tokenRoutes  = require('./Routes/tokenRoutes');

app.use('/api', courseRoutes); // Les routes commencent par /api/courses/:id
app.use('/api', quizRoutes);   // Les routes commencent par /api/quiz/:courseId
app.use('/api', tokenRoutes);  // Les routes commencent par /api/tokens/:userId

// Démarrer le serveur
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});