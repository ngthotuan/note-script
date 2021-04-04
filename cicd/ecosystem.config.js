module.exports = {
    apps : [{
      name: 'test-cicd',
      script: 'src/bin/www',
      instance: 'max',
      exec_mode : "cluster",
      env: {
        "NODE_ENV": "development",
      },
      env_production : {
        "NODE_ENV": "production"
      }
    }],
};