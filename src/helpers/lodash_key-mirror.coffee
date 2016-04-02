_ = require 'lodash'

_.mixin
  keyMirror : (keys)->
    keys = if Array.isArray(keys) then keys else Object.keys(keys);
    _.reduce(keys, (res, v)->
        res[v] = v;
        return res;
    , {})
