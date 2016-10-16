Chai = require 'chai'
{expect} = Chai

adb = require '../adb'
client = adb.createClient {host:'localhost',port:5078}

describe 'GetPropertiesCommand', ->
  it "should send 'adb shell getprop' <right>",() ->
    client.getProperties '123456',(err,data) ->
      if err == null
        expect(data).to.be.instanceof Object
        expect(data).to.have.property 'af.rf_info'
        expect(data).to.have.property 'af.rf_info','273'
      else
        expect(err).to.be.an.instanceof Error
        expect(err.message).to.equal 'error: device not found.'
    .then (data) ->
      expect(data).to.be.instanceof Object
      expect(data).to.have.property 'af.rf_info'
      expect(data).to.have.property 'af.rf_info','273'
    .catch (err) ->
      expect(err).to.be.an.instanceof Error
      expect(err.message).to.equal 'error: device not found.'