Promise = require 'bluebird'
Command = require './Command'
ChildProcess = require 'child_process'

class ClearCommand extends Command
  execute : (serial,callback) ->
    resolver = Promise.defer()
    spawn = ChildProcess.spawn
    action = spawn @cmd,@args
    isSuccess = null
    returnValue = true
    action.stdout.on 'data',(data) ->
      result = new Buffer(data).toString()
      if result != null
        result = result.replace /\n/g,'.'
      if result.indexOf('Success') > -1
        returnValue = true
      else
        isSuccess = new Error(result)
        returnValue = false
      resolver.resolve returnValue
    action.stderr.on 'data',(data) ->
      returnValue = new Buffer(data).toString()
      if returnValue != null
        returnValue = returnValue.replace /\n/g,'.'
      isSuccess = new Error(returnValue)
      resolver.reject isSuccess
    action.on 'close',(data) ->
    resolver.promise.finally ->
      callback(isSuccess,returnValue)

module.exports = ClearCommand