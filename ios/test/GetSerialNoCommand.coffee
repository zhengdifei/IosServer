Chai = require 'chai'
{expect} = Chai

adb = require '../adb'
client = adb.createClient {host:'localhost',port:5078}

describe 'GetSerialNoCommand', ->
  it "should send 'adb get-serialno' <right>",() ->
    client.getSerialNo '123456',(err,data) ->
      if err == null
        expect(data).to.equal 'QLXBBCA671245055'
      else
        expect(err).to.be.an.instanceof Error
        expect(err.message).to.equal 'error: unknown'
    .then (data) ->
      expect(data).to.equal 'QLXBBCA671245055'
    .catch (err) ->
      expect(err).to.be.an.instanceof Error
      expect(err.message).to.equal 'error: unknown'