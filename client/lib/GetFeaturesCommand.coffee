Promise = require 'bluebird'
Command = require './Command'
ChildProcess = require 'child_process'

class GetFeaturesCommand extends Command
  execute : (serial,callback) ->
    resolver = Promise.defer()
    spawn = ChildProcess.spawn
    action = spawn @cmd,@args
    isSuccess = null
    returnValue = []
    action.stdout.on 'data',(data) ->
      featuresStr = new Buffer(data).toString().trim()
      featuresStr.trim().split('\n').forEach (featrue) ->
        returnValue.push featrue.slice(8)
      if returnValue.length > 1
        resolver.resolve returnValue
    action.stderr.on 'data',(data) ->
      returnValue = []
      errorInfo = new Buffer(data).toString()
      if errorInfo != null
        errorInfo = errorInfo.replace /\n/g,'.'
      isSuccess = new Error(errorInfo)
      resolver.reject isSuccess
    action.on 'close',(data) ->
      isSuccess = true
      resolver.resolve 'close'
    resolver.promise.finally ->
      callback(isSuccess,returnValue)

module.exports = GetFeaturesCommand