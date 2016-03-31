###*
 *  Interface
 *  + manage routes and show correct page
 *  
 *  @author Nicolas Husson <hello@nusson.ninja>
###
'use strict'

Ractive = require 'ractive'
Router  = require 'app/router.coffee'
require './assets/style.styl'

Interface = Ractive.extend
  el: '#ractive'
  data:->
    route: 'default'
  oninit:->
    Router.subject.subscribe (data, page)=>
      @set 'route', data.key
      return if not data?.view?
      p = new data.view
        el: '#view'
    console.log 'interface init'

  template: '
    <h1>Page : {{route}}</h1>
    <div id="view"></div>
  '

instance  = new Interface()
module.exports = instance