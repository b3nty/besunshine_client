const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

environment.loaders.append('jquery', {
  test: require.resolve('jquery'),
  rules: [
    {
      loader: 'expose-loader',
      options: {
        exposes: ['$', 'jQuery'],
      },
    },
  ],
});

module.exports = environment;
