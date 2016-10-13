Promise = require 'bluebird'
Command = require './Command'
ChildProcess = require 'child_process'
Tracker = require './Tracker'

class WaitForDeviceCommand extends Command
  execute : (callback) ->
    resolver = Promise.defer()
    spawn = ChildProcess.spawn
    action = spawn @cmd,@args
    isSuccess = null
    tracker = new Tracker
    action.on 'close',(data) ->
      tracker.findDevice()
    resolver.resolve tracker
    resolver.promise.finally ->
     callback isSuccess,tracker

module.exports = WaitForDeviceCommand