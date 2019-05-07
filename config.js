const config = {
  environment: process.env.NODE_ENV || 'dev',
  access_key: process.env.ACCESS_KEY,
  server: {
    port: process.env.PORT || 3000,
  },
};

module.exports = config;
