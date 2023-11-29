const express = require('express');
const coursController = require('../Controller/coursController');

const router = express.Router();

// Route pour obtenir les détails d'un cours
router.get('/cours', coursController.getAllCours);
router.post('/cours', coursController.addCours);
router.put('/cours/:id', coursController.updateCours);
router.delete('/cours/:id', coursController.deleteCours);
router.put('/cours/:id/favori', coursController.toggleFavori);

module.exports = router;