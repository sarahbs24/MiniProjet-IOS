const express = require('express');
const tokenController = require('../Controller/tokenController');

const router = express.Router();

// Route pour mettre à jour le nombre de jetons pour un utilisateur
router.post('/tokens/:userId', tokenController.updateTokens);

module.exports = router;