const DEBUG = process.env.NODE_ENV !== 'production';

module.exports = {
  context: __dirname,
  devtool: DEBUG ? 'cheap-module-eval-source-map' : 'hidden-source-map',
  entry: './src/App',

  devServer: {
    contentBase: '.',
    port: 4008,
    stats: 'errors-only'
  },

  output: {
    path: __dirname,
    pathinfo: true,
    filename: 'bundle.js',
    devtoolModuleFilenameTemplate: 'webpack:///[absolute-resource-path]',
  },

  module: {
    loaders: [
      {
        test: /\.purs$/,
        loader: 'purs-loader',
        exclude: /node_modules/,
        query: {
          src: [
            'bower_components/purescript-*/src/**/*.purs',
            'src/*.purs'
          ],
          bundle: false,
          psc: 'psa',
          pscIde: false
        }
      }
    ]
  },

  resolve: {
    modules: [ 'node_modules', 'bower_components' ],
    extensions: [ '.purs', '.js']
  },

};
