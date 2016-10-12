Promise = require 'bluebird'
WaitForDevibceCommand = require './lib/WaitForDeviceCommand'
ListDevicesCommand = require './lib/ListDevicesCommand'

class Adb
  constructor : (options) ->
    host = options.host
    port = options.port
  #创建adb实例
  @createClient : (options) ->
    new Adb options
  #listDevices
  listDevices : (callback) ->
    resolver = Promise.defer()
    new ListDevicesCommand 'adb','devices'
      .execute()
      .then (serialId) ->
        resolver.resolve serialId
      .catch (err) ->
        resolver.reject err
      .nodeify callback
    resolver.promise
  #track
  trackDevices : (callback) ->
    resolver = Promise.defer()
    new WaitForDevibceCommand 'adb','wait-for-device'
      .execute()
      .then (tracker) ->
        resolver.resolve tracker
      .nodeify callback
    resolver.promise



module.exports = Adb