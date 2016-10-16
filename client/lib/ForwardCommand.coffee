Promise = require 'bluebird'
Command = require './Command'
ChildProcess = require 'child_process'

class ForwardCommand extends Command
  execute : (serial,callback) ->
    resolver = Promise.defer()
    spawn = ChildProcess.spawn
    action = spawn @cmd,@args
    isSuccess = null
    returnValue = true
    action.stdout.on 'data',(data) ->
      resolver.resolve returnValue
    action.stderr.on 'data',(data) ->
      returnValue = false
      errorInfo = new Buffer(data).toString()
      if errorInfo != null
        errorInfo = errorInfo.replace /\n/g,'.'
        isSuccess = new Error(errorInfo)
      if errorInfo.indexOf('device') > -1
        resolver.reject isSuccess
      else
        resolver.resolve returnValue
    action.on 'close',(data) ->
      resolver.resolve returnValue
    resolver.promise.finally ->
      callback(isSuccess,returnValue)

module.exports = ForwardCommand