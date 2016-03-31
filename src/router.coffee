###*
 *  Router
 *
 *  @author Nicolas Husson <hello@nusson.ninja>
###
'use strict'

#===========/-------------------------------------------
#  [_IMP]  /  Imports
#=========/---------------------------------------------
Page    = require 'page'
Rx      = require 'rx'
_       = require 'lodash'

keys    =
  INDEX:   'INDEX',
  RDV:     'RDV'

routes  =
  '/:lang/': 
    key:    keys.INDEX
  '/fr/rendez-vous':
    key:    keys.RDV

subject = new Rx.BehaviorSubject
  key:    null
  route:  null


#===========/-------------------------------------------
#  [_CBS]  /  Callbacks
#=========/---------------------------------------------
###*
 * default route
 * @param  {string} key   - route key (must be binded like Page '/', route.bind(@, keys.HOME))
 * @param  {[type]} route - Page's route
 * @return this and do a onNext to our subject
###
routing = (data, route)->
  
  cb  =  (Page)->
    subject.onNext _.extend {}, data,
      view: Page

  switch data.key
    when keys.INDEX
      # require can't use variable... You MUST add only strings
      require.ensure ['app/views/home/index.coffee'], (require)->
        require('app/views/home/index.coffee')(cb)
    when keys.RDV
      require.ensure ['app/views/rdv/index.coffee'], (require)->
        require('app/views/rdv/index.coffee')(cb)
  @

_.each routes, (data, route)->
  Page route, routing.bind(@, data)


Page()

#===========/-------------------------------------------
#  [_EXP]  /  Exports
#=========/---------------------------------------------
module.exports =
  subject:  subject
  keys:     keys
  routes:   routes