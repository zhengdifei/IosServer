Chai = require 'chai'
{expect} = Chai

ClearCommand = require '../lib/ClearCommand'
adb = require '../adb'
client = adb.createClient {host:'localhost',port:5078}

describe 'ClearCommand', ->
  it "should send 'adb shell pm clear <right pkg>",() ->
    client.clear '123456','com.achievo.vipshop',(err,data) ->
      if err == null
        expect(err).to.be.a 'null'
        expect(data).to.true
    .then (data) ->
      expect(data).to.true
    .catch (err) ->
      expect(err).to.be.an.instanceof Error

  it "should send 'adb shell pm clear <wrong pkg>",() ->
    client.clear '123456','com.achievo.vipshop1',(err,data) ->
      if err == null
        expect(err).to.be.an.instanceof Error
        expect(data).to.false
    .then (data) ->
      expect(data).to.false
    .catch (err) ->
      expect(err).to.be.an.instanceof Error