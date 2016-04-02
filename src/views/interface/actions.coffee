###*
 *  Interface actions
 *  @type {object}
 *  @author Nicolas Husson <hello@nusson.ninja>
###
'use strict'
_       = require 'lodash'
Rx      = require 'rx'
subject = new Rx.ReplaySubject 1

# Our differents actions
keys    = _.keyMirror [
  'RESIZE'
  'CHANGE_MODE'
]

# Device mode base on window's width
modes    = _.keyMirror [
  'BIG-DESKTOP'
  'DESKTOP'
  'TABLET'
  'MOBILE'
]

actions =
  subject:  subject
  keys:     keys
  MODES:    modes

  changeMode:   (mode)->
    subject.onNext
      key:   keys.CHANGE_MODE
      value: mode

  resizeHandler:   (event)->
    subject.onNext
      key:   keys.RESIZE
      value: event

  resizeFromSource: (source)->
    source.subscribe @resizeHandler

# export
module.exports = actions
