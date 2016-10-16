Chai = require 'chai'
{expect} = Chai

adb = require '../adb'
client = adb.createClient {host:'localhost',port:5078}

describe 'TrackDevicesCommand', ->
  it "should send 'adb wait-for-device' <right>",() ->
    client.trackDevices (err,data) ->
      if err == null
        expect(data).to.equal 'QLXBBCA671245055'
      else
        expect(err).to.be.an.instanceof Error
        expect(err.message).to.equal 'can\'t find a device'
    .then (data) ->
      expect(data).to.equal 'QLXBBCA671245055'
    .catch (err) ->
      expect(err).to.be.an.instanceof Error
      expect(err.message).to.equal 'can\'t find a device'