Promise = require 'bluebird'
Command = require './Command'
ChildProcess = require 'child_process'

class GetPropertiesCommand extends Command
  execute : (serial,callback) ->
    resolver = Promise.defer()
    spawn = ChildProcess.spawn
    action = spawn @cmd,@args
    isSuccess = null
    properties =  {}
    action.stdout.on 'data',(data) ->
      propertiesStr = new Buffer(data).toString().trim().split '\n'
      propertiesStr.forEach (property) ->
        propertyObj = property.trim().split ':'
        if propertyObj[1]
          properties[propertyObj[0].slice(1,-1)] = propertyObj[1].trim().slice(1,-1)
      resolver.resolve properties
    action.stderr.on 'data',(data) ->
      isSuccess = true
      resolver.reject new Buffer(data).toString()
    action.on 'close',(data) ->
      resolver.resolve 'close'
    resolver.promise.finally ->
      callback(isSuccess,properties)

module.exports = GetPropertiesCommand