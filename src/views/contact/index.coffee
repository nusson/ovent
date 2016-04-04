###*
 *  Sidebar
 *  + Adding styles
 *  + open/close
 *  
 *  @author Nicolas Husson <hello@nusson.ninja>
###
'use strict'

Ractive   = require 'ractive'
# require './assets/style.styl'

ContactForm = Ractive.extend
  el:       '#contact'
  template: require './assets/template'

module.exports = ContactForm
