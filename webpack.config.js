module.exports = {
  entry: './index.js',
  output: {
    filename: 'app/assets/javascripts/bundle.js',
  },
  externals: {
    'react': 'React',
    'react-dom': 'ReactDOM',
  },
  resolve: {
    extensions: ['', '.js', '.json']
  },
  module: {
    loaders: [{
     test: /\.json$/,
     loader: 'json',
   }],
  },
}
