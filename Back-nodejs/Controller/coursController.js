const Cours = require('../models/cours');

// Récupérer la liste des cours
exports.getAllCours=async (req, res) => {
  try {
    const cours = await Cours.find();
    res.json(cours);
  } catch (error) {
    res.status(500).json({ error: 'Erreur lors de la récupération des cours' });
  }
};
// Ajouter un cours
exports.addCours= async (req, res) => {
  const nouveauCours = req.body;
  try {
    const createdCours = await Cours.create(nouveauCours);
    res.status(201).json(createdCours);
  } catch (error) {
    res.status(400).json({ error: 'Erreur lors de l\'ajout du cours' });
  }
};
// Mettre à jour un cours
exports.updateCours= async (req, res) => {
  const id = req.params.id;
  const coursModifie = req.body;
  try {
    const updatedCours = await Cours.findByIdAndUpdate(id, coursModifie, { new: true });
    res.json(updatedCours);
  } catch (error) {
    res.status(400).json({ error: 'Erreur lors de la mise à jour du cours' });
  }
};
// Supprimer un cours
exports.deleteCours= async (req, res) => {
  const id = req.params.id;
  try {
    await Cours.findByIdAndDelete(id);
    res.json({ message: 'Cours supprimé avec succès' });
  } catch (error) {
    res.status(500).json({ error: 'Erreur lors de la suppression du cours' });
  }
};
// Marquer/démarquer un cours comme favori
exports.toggleFavori= async (req, res) => {
  const id = req.params.id;
  try {
    const coursFavori = await Cours.findById(id);
    if (coursFavori) {
      coursFavori.favori = !coursFavori.favori;
      await coursFavori.save();
      res.json({ message: 'Statut favori mis à jour avec succès' });
    } else {
      res.status(404).json({ error: 'Cours non trouvé' });
    }
  } catch (error) {
    res.status(500).json({ error: 'Erreur lors de la mise à jour du statut favori' });
  }
};
