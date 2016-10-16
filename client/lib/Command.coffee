Promise = require 'bluebird'

class Command
  constructor : (@cmd,@args...) ->
  execute : (serial,callback) ->
    error = new Error('the command is not support')
    resolver = Promise.defer()
    resolver.reject error
    resolver.promise.finally ->
      callback(error)

module.exports = Command