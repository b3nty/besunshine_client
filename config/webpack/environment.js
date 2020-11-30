const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.loaders.prepend('sass', {
    test: /\.(css|scss|sass)$/,
    use: [{
        loader: 'style-loader'
    }, {
        loader: 'css-loader'
    }, {
        loader: 'sass-loader',
        options: {
            includePaths: ['node_modules'],
        }
    }]
})

module.exports = environment
