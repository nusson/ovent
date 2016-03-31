###*
 *  Interface
 *  + manage routes and show correct page
 *  
 *  @author Nicolas Husson <hello@nusson.ninja>
###
'use strict'

Ractive = require 'ractive'
#Router  = require 'app/router.coffee'
require './assets/style.styl'

Interface = Ractive.extend
  el: '#routing'
  data:->
    route: 'default'
  oninit:->
    #Router.subject.subscribe (data, page)=>
    #  @set 'route', data.key
    #  return if not data?.page?
    #  p = new data.page
    #    el: '#page'
    console.log 'interface init'

  template: '
    <h1>Page : {{route}}</h1>
    <div id="page"></div>
  '

instance  = new Interface()
module.exports = instance