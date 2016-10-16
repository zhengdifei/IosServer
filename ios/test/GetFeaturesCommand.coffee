Chai = require 'chai'
{expect} = Chai

adb = require '../adb'
client = adb.createClient {host:'localhost',port:5078}

describe 'GetFeaturesCommand', ->
  it "should send 'adb shell pm list features' <right>",() ->
    client.getFeatures '123456',(err,data) ->
      if err == null
        expect(data).to.be.instanceof Array
        expect(data).to.have.length.above 10
      else
        expect(err).to.be.an.instanceof Error
        expect(err.message).to.equal 'error: device not found.'
    .then (data) ->
      expect(data).to.be.instanceof Array
      expect(data).to.have.length.above 10
    .catch (err) ->
      expect(err).to.be.an.instanceof Error
      expect(err.message).to.equal 'error: device not found.'