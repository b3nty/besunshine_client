const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.loaders.get('sass').use
   .find(item => item.loader === 'sass-loader').options.sassOptions.includePaths.push(...['node_modules'])

module.exports = environment
