###*
 *  Interface states
 *  + save current window size
 *  + device mode based on window's width
 *  
 *  @todo , like sidebar, based on ractive
 *  
 *  @author Nicolas Husson <hello@nusson.ninja>
###
'use strict'
Rx      = require 'rx'
Actions = require './actions'


state   =
  width:  0
  height: 0
  mode:   null

subject = new Rx.BehaviorSubject state

# Update all states and compute device mode
updateState = (target)->
  Rx.Observable.just(target)
  .filter (target)->
    target.innerWidth? and target.innerHeight
  .map (target)->
    width:  target.innerWidth
    height: target.innerHeight
  .map (sizes)->
    # @todo flat map d'un if then...
    _.merge sizes,
      mode : if (w = sizes.width) < 680 then Actions.MODES.MOBILE
      else if w <= 1024 then Actions.MODES.TABLET
      else if w <= 1600 then Actions.MODES.DESKTOP
      else Actions.MODES.BIG_DESKTOP

###*
 * listen for RESIZE action
 * @type {[type]}
###
resizeHanler  = Actions.subject
.filter (action)->
  action.key is Actions.keys.RESIZE
.debounce ->          Rx.Observable.timer 250
.map (action)->       action.value
.map (event)->        event.target
.startWith(window)    # Magic, first lanch shortcup ;)
.flatMap (target)->   updateState(target)

# Big final subscribe
# + our subject dispatch new state
# + if we change device mode, it will dispatch a changeMode action
resizeHanler.subscribe (newState)->
  if (mode = newState.mode) isnt state.mode
    Actions.changeMode mode

  _.merge state, newState
  subject.onNext state


# export only our subject
module.exports = subject
