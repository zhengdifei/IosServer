Chai = require 'chai'
{expect} = Chai

adb = require '../adb'
client = adb.createClient {host:'localhost',port:5078}

describe 'GetStateCommand', ->
  it "should send 'adb get-state' <right>",() ->
    client.getState '123456',(err,data) ->
      if err == null
        expect(data).to.equal 'device'
      else
        expect(err).to.be.an.instanceof Error
        expect(err.message).to.equal 'error: unknown'
    .then (data) ->
      expect(data).to.equal 'device'
    .catch (err) ->
      expect(err).to.be.an.instanceof Error
      expect(err.message).to.equal 'error: unknown'