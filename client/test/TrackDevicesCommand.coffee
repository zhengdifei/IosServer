Chai = require 'chai'
{expect} = Chai

adb = require '../adb'
Tracker = require '../lib/Tracker'
client = adb.createClient {host:'localhost',port:5078}

describe 'TrackDevicesCommand', ->
  it "should send 'adb wait-for-device' <right>",() ->
    client.trackDevices (err,data) ->
      expect(data).to.be.an.instanceof Tracker
    .then (data) ->
      expect(data).to.be.an.instanceof Tracker
    .catch (err) ->
      expect(err).to.be.an.instanceof Error
      expect(err.message).to.equal 'can\'t find a device'