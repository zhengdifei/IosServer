Chai = require 'chai'
{expect} = Chai

ios = require '../ioskit'
client = ios.createClient {host:'localhost',port:5078}

describe 'ClearCommand', ->
  it "should send 'idevice -l' <right>",() ->
    client.listDevices (err,data) ->
      if err == null
        expect(data).to.equal '6dff3d0c838ae0275f1e4daa0f4757d9022d6ebd'
      else
        expect(err).to.be.an.instanceof Error
        expect(err.message).to.equal 'can\'t find a device'
    .then (data) ->
      expect(data).to.equal '6dff3d0c838ae0275f1e4daa0f4757d9022d6ebd'
    .catch (err) ->
      expect(err).to.be.an.instanceof Error
      expect(err.message).to.equal 'can\'t find a device'