const Router = require('express').Router;
const router = new Router();
const config = require('./config');
const Mercury = require('@postlight/mercury-parser');

router.route('/').get((req, res) => {
  res.json({
    message: 'Welcome to 🚀mercury-parser-api API! Endpoint: /parser',
  });
});

router.route('/parser').get(async (req, res) => {
  let result = { message: 'No URL was provided' };
  if (req.headers.authorization == config.access_key) {
    if (req.query.url) {
      try {
        result = await Mercury.parse(req.query.url);
      } catch (error) {
        result = { error: true, messages: error.message };
      }
    }
  } else {
    result = { message: 'Unauthorized' };
  }
  return res.json(result);
});

module.exports = router;
