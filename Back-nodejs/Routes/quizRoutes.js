// quizRoutes.js

const express = require('express');
const quizController = require('../Controller/quizController');

const router = express.Router();

// Route pour obtenir la liste des quizzes d'un cours
router.get('/quizzes/:coursId', quizController.getAllQuizzes);

// Route pour ajouter un nouveau quiz à un cours
router.post('/quizzes/:coursId', quizController.addQuiz);

// Route pour mettre à jour un quiz existant
router.put('/quizzes/:id', quizController.updateQuiz);

// Route pour supprimer un quiz
router.delete('/quizzes/:id', quizController.deleteQuiz);

module.exports = router;
