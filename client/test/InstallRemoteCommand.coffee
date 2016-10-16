Chai = require 'chai'
{expect} = Chai

adb = require '../adb'
client = adb.createClient {host:'localhost',port:5078}

describe 'InstallRemoteCommand', ->
  it "should send 'adb installRemote file' <right>",() ->
    client.installRemote '123456','/data/local/tmp/STFserver.apk',(err,data) ->
      if err == null
        expect(data).to.true
      else
        expect(err).to.be.an.instanceof Error
        expect(err.message).to.equal 'the command is not support'
    .then (data) ->
      expect(data).to.equal true
    .catch (err) ->
      expect(err).to.be.an.instanceof Error
      expect(err.message).to.equal 'the command is not support'