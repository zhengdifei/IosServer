Promise = require 'bluebird'
WaitForDevibceCommand = require './lib/WaitForDeviceCommand'
ListDevicesCommand = require './lib/ListDevicesCommand'
GetPropertiesCommand = require './lib/GetPropertiesCommand'

class Adb
  constructor : (options) ->
    host = options.host
    port = options.port
  #创建adb实例
  @createClient : (options) ->
    new Adb options
  #列出设备
  listDevices : (callback) ->
    resolver = Promise.defer()
    new ListDevicesCommand 'adb','devices'
      .execute(callback)
      .then (serialId) ->
        resolver.resolve serialId
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #跟踪设备
  trackDevices : (callback) ->
    resolver = Promise.defer()
    new WaitForDevibceCommand 'adb','wait-for-device'
      .execute(callback)
      .then (tracker) ->
        resolver.resolve tracker
    resolver.promise
  #获取设备信息
  getProperties : (serial,callback) ->
    resolver = Promise.defer()
    new GetPropertiesCommand 'adb','shell','getprop'
      .execute(serial,callback)
      .then (properties) ->
        resolver.resolve properties
    resolver.promise





module.exports = Adb