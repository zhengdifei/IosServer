Chai = require 'chai'
{expect} = Chai

ios = require '../ioskit'
client = ios.createClient {host:'localhost',port:5078}

describe 'GetPropertiesCommand', ->
  it "should send 'ideviceinfo -u UUID' <right>",() ->
    client.getProperties '6dff3d0c838ae0275f1e4daa0f4757d9022d6ebd',(err,data) ->
      if err == null
        console.log data
        expect(data).to.be.instanceof Object
        expect(data).to.have.property 'ActivationState'
        expect(data).to.have.property 'ActivationState','Activated'
      else
        expect(err).to.be.an.instanceof Error
        expect(err.message).to.equal 'error: device not found.'
    .then (data) ->
      expect(data).to.be.instanceof Object
      expect(data).to.have.property 'ActivationState'
      expect(data).to.have.property 'ActivationState','Activated'
    .catch (err) ->
      expect(err).to.be.an.instanceof Error
      expect(err.message).to.equal 'error: device not found.'