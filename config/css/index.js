/*
	Use default config within webpack stylus-loader
	so can be accessible through all stylus files :)
	
	@author Nicolas Husson <hello@nusson.ninja>
*/
module.exports = function(opts) {
  var implicit = (opts && opts.implicit == false) ? false : true;

  return function(style){
    style.include(__dirname);
    if (implicit) { style.import('libs'); }
  }
}