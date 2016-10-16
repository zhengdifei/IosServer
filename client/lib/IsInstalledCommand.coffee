Promise = require 'bluebird'
Command = require './Command'
ChildProcess = require 'child_process'

class IsInstalledCommand extends Command
  execute : (serial,callback) ->
    resolver = Promise.defer()
    spawn = ChildProcess.spawn
    action = spawn @cmd,@args
    isSuccess = null
    returnValue = ''
    action.stdout.on 'data',(data) ->
      returnValue = new Buffer(data).toString()
      returnValue = returnValue.replace /\n/g,''
      returnValue = returnValue.replace /\r/g,''
      if returnValue.indexOf('apk') > -1
        resolver.resolve returnValue
      else if  returnValue.indexOf('can\'t find') > -1
        returnValue = "unknown"
        isSuccess = new Error(returnValue)
        resolver.reject isSuccess
    action.stderr.on 'data',(data) ->
      errorInfo = new Buffer(data).toString()
      if errorInfo != null
        errorInfo = errorInfo.replace /\n/g,'.'
      isSuccess = new Error(errorInfo)
      resolver.reject isSuccess
    resolver.promise.finally ->
      callback(isSuccess,returnValue)

module.exports = IsInstalledCommand