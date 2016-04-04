###*
 *  Interface
 *  + manage routes and show correct page
 *  
 *  @author Nicolas Husson <hello@nusson.ninja>
###
'use strict'

Ractive   = require 'ractive'
Router    = require 'app/router.coffee'
Template  = require './assets/template.html'
Sidebar   = require 'app/views/sidebar/index.coffee'
Footer   = require 'app/views/footer/index.coffee'
require './assets/style.styl'

Actions     = require './actions'
States      = require './states'

Interface = Ractive.extend
  el: '#ractive'
  data:->
    route: 'default'
  oninit:->
    # @todo : Manage routes
    Router.subject.subscribe (data, page)=>
      @set 'route', data.key
      return if not data?.view?
      p = new data.view
        el: '#view'

    # Dispatch resize
    Actions.resizeFromSource Rx.DOM.resize(window)

  template: Template

instance  = new Interface()
module.exports = instance
