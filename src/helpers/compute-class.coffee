###*
 * Compute features to css classes
 * - each keys prefixed by a prefix
 *
 * @param  {string} keypath - keypath to watch
 * @param  {string} prefix='-' prefix for keys
 * @return {string} '-featureA -featureB'
###
module.exports = (datas, prefix='-')->
  # manage ractive model
  d = datas.get?() or datas

  features = _.map d, (value, key)->
    if value is true or not _.isEmpty value
      prefix+''+key
    else null
  features = _.without(features, null )

  return ' '+features.join(' ') if not _.isEmpty features
  ''
