Chai = require 'chai'
{expect} = Chai

adb = require '../adb'
client = adb.createClient {host:'localhost',port:5078}

describe 'GetDevicePathCommand', ->
  it "should send 'adb get-devpath' <right>",() ->
    client.getDevicePath '123456',(err,data) ->
        console.log err
        console.log data
        expect(err).to.be.a 'null1'
        expect(data).to.equal '1usb:1-1'
    .then (data) ->
      console.log data
      expect(data).to.true
    .catch (err) ->
      expect(err).to.be.an.instanceof Error