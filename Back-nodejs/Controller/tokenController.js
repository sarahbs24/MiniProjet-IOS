const Token = require('../models/token');

// Mettre à jour le nombre de jetons pour un utilisateur par son ID
exports.updateTokens = async (req, res) => {
  try {
    const userId = req.params.userId;
    const { tokens } = req.body;

    // Mettez à jour le nombre de jetons pour l'utilisateur spécifié
    await Token.findOneAndUpdate({ userId: userId }, { tokens: tokens }, { upsert: true });

    res.json({ message: 'Tokens updated successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};