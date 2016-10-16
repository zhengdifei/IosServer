Chai = require 'chai'
{expect} = Chai

adb = require '../adb'
client = adb.createClient {host:'localhost',port:5078}

describe 'ForwarCommand', ->
  it "should send 'adb forward local remote' <right>",() ->
    client.forward '123456','tcp:1717','localabstract:minicap',(err,data) ->
      if err == null
        expect(err).to.be.a 'null'
        expect(data).to.true
    .then (data) ->
      expect(data).to.true
    .catch (err) ->
      expect(err).to.be.an.instanceof Error

  it "should send 'adb forward local remote' <wrong>",() ->
    client.forward '123456','tc:1717','localabstract:minicap1',(err,data) ->
      if err == null
        expect(err).to.be.an.instanceof Error
        expect(data).to.false
    .then (data) ->
      expect(data).to.false
    .catch (err) ->
      expect(err).to.be.an.instanceof Error