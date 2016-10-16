Promise = require 'bluebird'
Command = require './Command'
ChildProcess = require 'child_process'

class InstallCommand extends Command
  execute : (serial,callback) ->
    resolver = Promise.defer()
    spawn = ChildProcess.spawn
    action = spawn @cmd,@args
    isSuccess = null
    returnValue = true
    action.stdout.on 'data',(data) ->
      resultInfo = new Buffer(data).toString()
      if resultInfo.indexOf('Copying') > -1
        resolver.resolve returnValue
      else
        returnValue = "err:install fail"
        isSuccess = new Error(returnValue)
        resolver.reject isSuccess
    action.stderr.on 'data',(data) ->
      returnValue = false
      errorInfo = new Buffer(data).toString()
      if errorInfo != null
        errorInfo = errorInfo.replace /\n/g,'.'
        if errorInfo.indexOf('No such file or directory') > -1
          errorInfo = 'No such file or directory'
      isSuccess = new Error(errorInfo)
      resolver.reject isSuccess
    action.on 'close',(data) ->
    resolver.promise.finally ->
      callback(isSuccess,returnValue)

module.exports = InstallCommand