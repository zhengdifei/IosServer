Chai = require 'chai'
{expect} = Chai

adb = require '../adb'
client = adb.createClient {host:'localhost',port:5078}

describe 'IsInstallCommand', ->
  it "should send 'adb isInstall file' <right>",() ->
    client.isInstall '123456','com.achievo.vipshop',(err,data) ->
      if err == null
        expect(data).to.equal '/system/vendor/operator/app/vipshop_20160420/vipshop_20160420.apk'
      else
        expect(err).to.be.an.instanceof Error
        expect(err.message).to.equal 'error: device not found.'
    .then (data) ->
      expect(data).to.equal '/system/vendor/operator/app/vipshop_20160420/vipshop_20160420.apk'
    .catch (err) ->
      expect(err).to.be.an.instanceof Error
      expect(err.message).to.equal 'error: device not found.'