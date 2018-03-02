const router = require('express').Router();

router.get('/', (req, res) => {
  res.status(200).json({
    success: true,
    message: 'Service is running',
  });
});

module.exports = router;
