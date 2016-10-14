Promise = require 'bluebird'
Command = require './Command'
ChildProcess = require 'child_process'

class ListDevicesCommand extends Command
  execute : (callback) ->
    resolver = Promise.defer()
    spawn = ChildProcess.spawn
    action = spawn @cmd,@args
    isSuccess = null
    serial = ''
    action.stdout.on 'data',(data) ->
      serialInfo = new Buffer(data).toString().trim().split '\n'
      if serialInfo.length > 1
        serial = serialInfo[1].trim().split('\t')[0]
        resolver.resolve serial
      else
        resolver.resolve ''
    action.stderr.on 'data',(data) ->
      resolver.reject new Buffer(data).toString()
    action.on 'close',(data) ->
      isSuccess = true
      resolver.resolve 'close'
    resolver.promise.finally ->
      callback(isSuccess,serial)

module.exports = ListDevicesCommand