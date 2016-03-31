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
    ]
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
  devServer: {
    port:         '8080',
    colors:       'true',
    host:         'ovent.int',
    hot:          true,
    contentBase:  'src/'
  },
  output: {
    path: paths.build,
    publicPath: "/build/",
    filename: "[name].bundle.js",
    chunkFilename: "[id].chunk.js"
  }
};