Promise = require 'bluebird'
Command = require './Command'
ChildProcess = require 'child_process'

class ListDevicesCommand extends Command
  execute : (callback) ->
    resolver = Promise.defer()
    spawn = ChildProcess.spawn
    action = spawn @cmd,@args
    isSuccess = null
    returnValue = ''
    action.stdout.on 'data',(data) ->
      serialInfo = new Buffer(data).toString().trim()
      if serialInfo != null
        returnValue = serialInfo
        resolver.resolve returnValue
      else
        isSuccess = new Error('can\'t find a device')
        resolver.reject isSuccess
    action.stderr.on 'data',(data) ->
      isSuccess = true
      resolver.reject new Buffer(data).toString()
    action.on 'close',(data) ->
      isSuccess = true
      resolver.resolve 'close'
    resolver.promise.finally ->
      callback(isSuccess,returnValue)

module.exports = ListDevicesCommand