###*
 *  Sidebar actions
 *  + TOGGLE
 *  + OPEN
 *  + CLOSE
 *  @type {object}
 *  @author Nicolas Husson <hello@nusson.ninja>
###
'use strict'
Rx	= require 'rx'
_	  = require 'lodash'

subject		= new Rx.ReplaySubject 1

keys    = _.keyMirror ['TOGGLE', 'OPEN', 'CLOSE']

actions =
  subject:  subject
  keys:     keys

  toggle:   (open=false)->
    subject.onNext
      key:   keys.TOGGLE

  toggleFromSource: (source)->
    source.subscribe @toggle

# export
module.exports = actions
