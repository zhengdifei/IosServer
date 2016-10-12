Promise = require 'bluebird'
Command = require './Command'
ChildProcess = require 'child_process'
Tracker = require './Tracker'

class WaitForDeviceCommand extends Command
  execute : () ->
    resolver = Promise.defer()
    tracker = new Tracker
    spawn = ChildProcess.spawn
    action = spawn @cmd,@args
    action.on 'close',(data) ->
      tracker.findDevice()
    resolver.resolve tracker
    resolver.promise

module.exports = WaitForDeviceCommand