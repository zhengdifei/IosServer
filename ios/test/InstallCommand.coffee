Chai = require 'chai'
{expect} = Chai

ios = require '../ioskit'
client = ios.createClient {host:'localhost',port:5078}

describe 'InstallCommand', ->
  it "should send 'ideviceinstaller -i path' <right>",() ->
    client.install '123456','/Users/yuyue/IosServer/luobo.ipa',(err,data) ->
      if err == null
        expect(data).to.true
      else
        expect(err).to.be.an.instanceof Error
        expect(err.message).to.equal 'No such file or directory'
    .then (data) ->
      expect(data).to.true
    .catch (err) ->
      expect(err).to.be.an.instanceof Error
      expect(err.message).to.equal 'No such file or directory'