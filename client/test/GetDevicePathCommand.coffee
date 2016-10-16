Chai = require 'chai'
{expect} = Chai

adb = require '../adb'
client = adb.createClient {host:'localhost',port:5078}

describe 'GetDevicePathCommand', ->
  it "should send 'adb get-devpath' <right>",() ->
    client.getDevicePath '123456',(err,data) ->
      if err == null
        expect(data).to.equal 'usb:1-1'
      else
        expect(err).to.be.an.instanceof Error
        expect(err.message).to.equal 'unknown'
    .then (data) ->
      expect(data).to.equal 'usb:1-1'
    .catch (err) ->
        expect(err).to.be.an.instanceof Error
        expect(err.message).to.equal 'unknown'