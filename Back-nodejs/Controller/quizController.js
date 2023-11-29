const Quiz = require('../models/quiz');
const Cours = require('../models/cours');

// Récupérer la liste des quizzes d'un cours
exports.getAllQuizzes = async (req, res) => {
  const coursId = req.params.coursId;

  try {
    // Vérifier si le cours existe avant de récupérer les quizzes
    const cours = await Cours.findById(coursId);
    if (!cours) {
      return res.status(404).json({ error: 'Cours non trouvé' });
    }

    const quizzes = await Quiz.find({ coursId });
    res.json(quizzes);
  } catch (error) {
    res.status(500).json({ error: 'Erreur lors de la récupération des quizzes' });
  }
};

// Ajouter un quiz à un cours
exports.addQuiz = async (req, res) => {
  const nouveauQuiz = req.body;

  try {
    // Ajouter le coursId à partir des paramètres de la requête
    nouveauQuiz.coursId = req.params.coursId;

    // Vérifier si le cours existe avant d'ajouter le quiz
    const cours = await Cours.findById(nouveauQuiz.coursId);
    if (!cours) {
      return res.status(404).json({ error: 'Cours non trouvé' });
    }

    const createdQuiz = await Quiz.create(nouveauQuiz);
    res.status(201).json(createdQuiz);
  } catch (error) {
    res.status(400).json({ error: 'Erreur lors de l\'ajout du quiz' });
  }
};

// Mettre à jour un quiz
exports.updateQuiz = async (req, res) => {
  const id = req.params.id;
  const quizModifie = req.body;

  try {
    const updatedQuiz = await Quiz.findByIdAndUpdate(id, quizModifie, { new: true });
    res.json(updatedQuiz);
  } catch (error) {
    res.status(400).json({ error: 'Erreur lors de la mise à jour du quiz' });
  }
};

// Supprimer un quiz
exports.deleteQuiz = async (req, res) => {
  const id = req.params.id;

  try {
    await Quiz.findByIdAndDelete(id);
    res.json({ message: 'Quiz supprimé avec succès' });
  } catch (error) {
    res.status(500).json({ error: 'Erreur lors de la suppression du quiz' });
  }
};
