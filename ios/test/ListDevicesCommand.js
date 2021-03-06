// Generated by CoffeeScript 1.11.1
(function() {
  var Chai, client, expect, ios;

  Chai = require('chai');

  expect = Chai.expect;

  ios = require('../ioskit');

  client = ios.createClient({
    host: 'localhost',
    port: 5078
  });

  describe('ClearCommand', function() {
    return it("should send 'idevice -l' <right>", function() {
      return client.listDevices(function(err, data) {
        if (err === null) {
          return expect(data).to.equal('6dff3d0c838ae0275f1e4daa0f4757d9022d6ebd');
        } else {
          expect(err).to.be.an["instanceof"](Error);
          return expect(err.message).to.equal('can\'t find a device');
        }
      }).then(function(data) {
        return expect(data).to.equal('6dff3d0c838ae0275f1e4daa0f4757d9022d6ebd');
      })["catch"](function(err) {
        expect(err).to.be.an["instanceof"](Error);
        return expect(err.message).to.equal('can\'t find a device');
      });
    });
  });

}).call(this);

//# sourceMappingURL=ListDevicesCommand.js.map
