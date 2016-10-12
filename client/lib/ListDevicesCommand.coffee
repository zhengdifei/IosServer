Promise = require 'bluebird'
Command = require './Command'
ChildProcess = require 'child_process'

class ListDevicesCommand extends Command
  execute : () ->
    resolver = Promise.defer()
    spawn = ChildProcess.spawn
    action = spawn @cmd,@args
    action.stdout.on 'data',(data) ->
      serialInfo = new Buffer(data).toString().trim().split '\n'
      if serialInfo.length > 1
        resolver.resolve serialInfo[1].trim().split('\t')[0]
      else
        resolver.resolve 'empty'
    action.stderr.on 'data',(data) ->
      resolver.reject new Buffer(data).toString()
    action.on 'close',(data) ->
      resolver.resolve 'close'
    resolver.promise.finally ->
      #console.log 'finally'

module.exports = ListDevicesCommand