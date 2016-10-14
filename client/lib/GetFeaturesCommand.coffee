Promise = require 'bluebird'
Command = require './Command'
ChildProcess = require 'child_process'

class GetDHCPIpAddressCommand extends Command
  execute : (callback) ->
    resolver = Promise.defer()
    spawn = ChildProcess.spawn
    action = spawn @cmd,@args
    isSuccess = null
    returnValue = ''
    action.stdout.on 'data',(data) ->
      returnValue = new Buffer(data).toString()
      resolver.resolve returnValue
    action.stderr.on 'data',(data) ->
      isSuccess = true
      resolver.reject new Buffer(data).toString()
    action.on 'close',(data) ->
      isSuccess = true
      resolver.resolve 'close'
    resolver.promise.finally ->
      callback(isSuccess,returnValue)

module.exports = GetDHCPIpAddressCommand