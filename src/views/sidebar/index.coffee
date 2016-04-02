###*
 *  Sidebar
 *  + Adding styles
 *  + open/close
 *  
 *  @author Nicolas Husson <hello@nusson.ninja>
###
'use strict'

Ractive   = require 'ractive'
Rx        = require 'rx'
require 'rx-dom'
Actions   = require './actions'
States    = require './states'
require './assets/style.styl'

Sidebar = Ractive.extend
  adapt:  ['Ractive']
  el:     '.sidebar'
  data:->
    states: States
  onrender:->
    @observe 'states.close', (n, o)=>
      @el.setAttribute 'aria-hidden', n

    Actions.toggleFromSource Rx.DOM.click @nodes['menu-toggle']

###*
 * We retourn directly this instance
 * but we inject the good dom selector AND it's current innerHTML
 * @type {Sidebar}
###
instance  = new Sidebar
  el: '#masthead'
  template: Ractive.parse document.querySelector('#masthead').innerHTML

module.exports = instance
