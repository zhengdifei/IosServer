Promise = require 'bluebird'
Command = require './Command'
ChildProcess = require 'child_process'

class ClearCommand extends Command
  execute : (callback) ->
    resolver = Promise.defer()
    spawn = ChildProcess.spawn
    action = spawn @cmd,@args
    isSuccess = null
    returnValue = true
    action.stdout.on 'data',(data) ->
      result = new Buffer(data).toString()
      if result != 'Success'
        returnValue = false
      resolver.resolve returnValue
    action.stderr.on 'data',(data) ->
      isSuccess = true
      resolver.reject new Buffer(data).toString()
    action.on 'close',(data) ->
      isSuccess = true
      resolver.resolve 'close'
    resolver.promise.finally ->
      callback(isSuccess,returnValue)

module.exports = ClearCommand