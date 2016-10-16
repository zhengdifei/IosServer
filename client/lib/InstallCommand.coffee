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
      resultInfo = resultInfo.replace /\n/g,''
      if resultInfo.indexOf('success') > -1
        resolver.resolve returnValue
      else
        returnValue = false
        isSuccess = new Error('error: install failed')
        resolver.reject isSuccess
    action.stderr.on 'data',(data) ->
      errorInfo = new Buffer(data).toString()
      if errorInfo != null
        errorInfo = errorInfo.replace /\n/g,'.'
      isSuccess = new Error(errorInfo)
      resolver.reject isSuccess
    action.on 'close',(data) ->
    resolver.promise.finally ->
      callback(isSuccess,returnValue)

module.exports = InstallCommand