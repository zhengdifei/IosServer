Chai = require 'chai'
{expect} = Chai

adb = require '../adb'
client = adb.createClient {host:'localhost',port:5078}

describe 'GetInstallCommand', ->
  it "should send 'adb install file' <right>",() ->
    client.install '123456','/data/local/tmp/STFserver.apk',(err,data) ->
      if err == null
        expect(data).to.equal 'device'
      else
        expect(err).to.be.an.instanceof Error
        expect(err.message).to.equal 'can\'t find \'/data/local/tmp/STFserver.apk\' to install.'
    .then (data) ->
      expect(data).to.equal 'device'
    .catch (err) ->
      expect(err).to.be.an.instanceof Error
      expect(err.message).to.equal 'can\'t find \'/data/local/tmp/STFserver.apk\' to install.'