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
      returnValue = new Buffer(data).toString()
      if returnValue != null
        returnValue = returnValue.replace /\n/g,'.'
      isSuccess = new Error(returnValue)
      resolver.reject isSuccess
    action.on 'close',(data) ->
      resolver.resolve returnValue
    resolver.promise.finally ->
      callback(isSuccess,returnValue)

module.exports = ForwardCommand