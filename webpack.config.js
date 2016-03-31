var path              = require("path");
var webpack           = require("webpack");

var koutoSwiss        = require('kouto-swiss');
var jeet              = require('jeet');
var rupture           = require('rupture');
var cssConfig         = require('./config/css');

//  Paths
var paths     = {
  root:  path.resolve(__dirname),
}
paths.src     = path.resolve(paths.root, 'src');
paths.build   = path.resolve(paths.root, "build");


// Config
module.exports = {
  entry: {
    'main':  [paths.src+'/main.coffee'],
    vendors: [
      'ractive', 'ractive-ractive',
      'lodash',
      'rx',
      'page'
    ],
    // debug: [
    //   'webpack/hot/only-dev-serve',
    //   'webpack-dev-server/client?http://0.0.0.0:3001'
    // ]
  },
  resolve: {
    alias: {
      app:  path.resolve(paths.src)
    }
  },
  module: {
    loaders: [
      { test: /\.css$/,       loader: "style!css" },
      { test: /\.styl$/,      loader: "style-loader!css-loader!stylus-loader" },
      { test: /\.coffee$/,    loader: 'coffee' },
      // { test: /\.html|ractive$/,  loader: 'ractive' },
    ]
  },
  plugins: [
    // new webpack.optimize.CommonsChunkPlugin('debug', 'debug.bundle.js'),
    new webpack.optimize.CommonsChunkPlugin('vendors', 'vendors.bundle.js'),
    new webpack.optimize.CommonsChunkPlugin({
      name:       'main',
      minChunks:  2,
      async:      true
    }),
    // new webpack.optimize.UglifyJsPlugin({
    //   compress: {
    //     warnings: false
    //   }
    // })

    new webpack.HotModuleReplacementPlugin(),
  ],
  stylus: {
    use: [
      koutoSwiss(),
      jeet(),
      rupture(),
      cssConfig()
    ],
    // import: [cssConfig()]
  },
  // devServer: {
  //   // port:         '80',
  //   colors:       'true',
  //   hot:          true,
  //   contentBase:  'src/'
  // },
  output: {
    path: paths.build,
    publicPath: "/wp-content/themes/ovent/build/",
    filename: "[name].bundle.js",
    chunkFilename: "[id].chunk.js"
  }
};