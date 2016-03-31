###*
 *  Entry point
 *  + require router and display good page
 * 
 *  @author Nicolas Husson <hello@nusson.ninja>
###
'use strict'

###*
 * Ractive general config
###
Ractive     = require 'ractive'
Ractive.adaptors.Ractive = require 'ractive-ractive'
# Ractive.defaults.adapt = ['Ractive']; # no generic but only in view than need a Ractive model
Ractive.defaults.isolated = true
Ractive.DEBUG = false;

# Add RXJS fromEventPattern directly in ractive prototype
# so ractive.stream('xxx')  = Rx.Observable.fromEventPattern ...
Ractive.prototype.stream  = (eventName)->
  ractive = @
  Rx.Observable.fromEventPattern(
    (h)-> ractive.on eventName, h
    (h)-> ractive.off eventName, h
  )

Interface = require 'app/views/interface/index.coffee'


module.exports = Interface
console.log 'coucou'