Chai = require 'chai'
{expect} = Chai

adb = require '../adb'
client = adb.createClient {host:'localhost',port:5078}

describe 'ForwardCommand', ->
  it "should send 'adb forward local remote' <right>",() ->
    client.forward '123456','tcp:1717','localabstract:minicap',(err,data) ->
        if err == null
          expect(data).to.true
        else
          expect(err).to.be.an.instanceof Error
          expect(err.message).to.equal 'error: device not found.'
    .then (data) ->
      expect(data).to.true
    .catch (err) ->
      expect(err).to.be.an.instanceof Error
      expect(err.message).to.equal 'error: device not found.'


  it "should send 'adb forward local remote' <wrong>",() ->
    client.forward '123456','tc:1717','localabstract:minicap1',(err,data) ->
      expect(data).to.false
      expect(err).to.be.an.instanceof Error
      if err.message.indexOf 'socket' > -1
        expect(err.message).to.equal 'error: cannot bind to socket.'
      else
        expect(err.message).to.equal 'error: device not found.'
    .then (data) ->
      expect(data).to.false
    .catch (err) ->
      expect(err).to.be.an.instanceof Error
      expect(err.message).to.equal 'error: device not found.'