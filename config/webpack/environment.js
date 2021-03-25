const {environment} = require('@rails/webpacker');

const webpack = require('webpack');
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  // $: 'jquery',
  // jQuery: 'jquery' ,
  $: 'jquery/src/jquery',
  jQuery: 'jquery/src/jquery',
  selectize: '?'
}));

module.exports = environment;