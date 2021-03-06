###*
 *  Rdv view
 *  
 *  @author Nicolas Husson <hello@nusson.ninja>
###
'use strict'

# # from vendors so before ensure
Ractive   = require 'ractive'

Contact   = require 'app/views/contact/index.coffee'

# for async
callback  = null
page      = null

require.ensure [], (require)->

  # Our page content
  page = Ractive.extend
    el: '#ractive'
    components:
      contact: Contact
    onrender:->
      console.log 'rdv rendered'
    template: '
      <h1>This is RDV page</h1>
      <contact />
    '

  # async export
  callback?(page)

module.exports = (cb)->
  if page? then cb(page) 
  else callback = cb
