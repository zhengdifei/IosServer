Chai = require 'chai'
{expect} = Chai

adb = require '../ioskit'
client = adb.createClient {host:'localhost',port:5078}

describe 'ClearCommand', ->
  it "should send 'adb shell pm clear <right pkg>",() ->
    client.clear '123456','com.achievo.vipshop',(err,data) ->
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

  it "should send 'adb shell pm clear <wrong pkg>",() ->
    client.clear '123456','com.achievo.vipshop1',(err,data) ->
      expect(data).to.false
      expect(err).to.be.an.instanceof Error
      if err.message.indexOf('Failed') > -1
        expect(err.message).to.equal 'Failed'
      else
        expect(err.message).to.equal 'error: device not found.'
    .then (data) ->
      expect(data).to.false
    .catch (err) ->
      expect(err).to.be.an.instanceof Error
      expect(err.message).to.equal 'error: device not found.'