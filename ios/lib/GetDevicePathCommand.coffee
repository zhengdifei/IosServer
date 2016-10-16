Promise = require 'bluebird'
Command = require './Command'
ChildProcess = require 'child_process'

class GetDevicePathCommand extends Command
  execute : (serial,callback) ->
    resolver = Promise.defer()
    spawn = ChildProcess.spawn
    action = spawn @cmd,@args
    isSuccess = null
    returnValue = ''
    action.stdout.on 'data',(data) ->
      returnValue = new Buffer(data).toString()
      returnValue = returnValue.replace /\n/g,''
      if returnValue.indexOf('unknown') > -1
        returnValue = "unknown"
        isSuccess = new Error(returnValue)
        resolver.reject isSuccess
      else
        resolver.resolve returnValue
    action.stderr.on 'data',(data) ->
      errorInfo = new Buffer(data).toString()
      if errorInfo != null
        errorInfo = errorInfo.replace /\n/g,'.'
      isSuccess = new Error(errorInfo)
      resolver.reject isSuccess
    resolver.promise.finally ->
      callback(isSuccess,returnValue)

module.exports = GetDevicePathCommand