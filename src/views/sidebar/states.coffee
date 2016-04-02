###*
 *  Sidebar states
 *  - will close on change device mode to mobile
 *
 *  @author Nicolas Husson <hello@nusson.ninja>
###
'use strict'
_       = require 'lodash'
Rx      = require 'rx'
Ractive = require 'ractive'
Actions = require './actions'
InterfaceActions = require 'app/views/interface/actions'

defaults =
  close: false

States  = Ractive.extend
  subject: new Rx.BehaviorSubject defaults
  data:-> defaults
  oninit:->
    console.log 'states init', @get()
    @watchClose().subscribe (states)=>
      console.log 'Sidebar state', states
      @set states
      @subject.onNext states

  ###*
   * Watch sidebar close
   * + on toggle
   * + on mobile mode
   * @return {rx.observable}
  ###
  watchClose:->
    console.log 'watchClose'
    Rx.Observable.merge(
      _changeToMobileHandler.bind(@)()
      _toogleHandler.bind(@)()
    )


###*
 * Hide sidebar if change mode mobile
 * @param  {object} action
 * @return {observable}
###
_changeToMobileHandler  = ->
  InterfaceActions.subject.filter (action)->
    action.key is InterfaceActions.keys.CHANGE_MODE
  .map (action)-> action.value
  .map (mode)=>
    close:     mode is InterfaceActions.MODES.MOBILE

###*
 * Toogle sidebar on event
 * @param  {object} action
 * @return {observable}
###
_toogleHandler  = ->
  Actions.subject.filter (action)->
    action.key is Actions.keys.TOGGLE
  .map ->           'close'
  .map (keypath)=>  @get keypath
  .map (value)->
    close: not value

instance  = new States
module.exports = instance
