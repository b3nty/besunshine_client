process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

environment.loaders.get('sass').use.find(item => item.loader === 'sass-loader').options.includePaths = ['node_modules']

module.exports = environment.toWebpackConfig()
