Chai = require 'chai'
{expect} = Chai

adb = require '../adb'
client = adb.createClient {host:'localhost',port:5078}

describe 'GetDHCPIpAddressCommand', ->
  it "should send 'adb shell getprop dhcp.<iface>.ipaddress' <right>",() ->
    client.getDHCPIpAddress '123456','wlan0',(err,data) ->
      if err == null
        expect(data).to.equal '192.168.3.30'
      else
        expect(err).to.be.an.instanceof Error
        expect(err.message).to.equal 'error: device not found.'
    .then (data) ->
      expect(data).to.equal '192.168.3.30'
    .catch (err) ->
      expect(err).to.be.an.instanceof Error
      expect(err.message).to.equal 'error: device not found.'


describe 'GetDHCPIpAddressCommand', ->
  it "should send 'adb shell getprop dhcp.<iface>.ipaddress' <wrong>",() ->
    client.getDHCPIpAddress '123456','wlan1',(err,data) ->
      expect(data).to.be.empty
      expect(err).to.be.an.instanceof Error
      if err.message.indexOf('ip') > -1
        expect(err.message).to.equal 'error:cannot find ip'
      else
        expect(err.message).to.equal 'error: device not found.'
    .then (data) ->
      expect(data).to.be.empty
    .catch (err) ->
      expect(err).to.be.an.instanceof Error
      expect(err.message).to.equal 'error: device not found.'