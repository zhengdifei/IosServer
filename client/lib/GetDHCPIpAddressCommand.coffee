Promise = require 'bluebird'
Command = require './Command'
ChildProcess = require 'child_process'

class GetDHCPIpAddressCommand extends Command
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
      if returnValue != ''
        resolver.resolve returnValue
      else
        isSuccess = new Error('error:cannot find ip')
        resolver.resolve returnValue
    action.stderr.on 'data',(data) ->
      returnValue = ''
      errorInfo = new Buffer(data).toString()
      if errorInfo != null
        errorInfo = errorInfo.replace /\n/g,'.'
      isSuccess = new Error(errorInfo)
      resolver.reject isSuccess
    action.on 'close',(data) ->
    resolver.promise.finally ->
      callback(isSuccess,returnValue)

module.exports = GetDHCPIpAddressCommand