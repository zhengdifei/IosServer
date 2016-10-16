// Generated by CoffeeScript 1.11.1
(function() {
  var Chai, adb, client, expect;

  Chai = require('chai');

  expect = Chai.expect;

  adb = require('../adb');

  client = adb.createClient({
    host: 'localhost',
    port: 5078
  });

  describe('GetDevicePathCommand', function() {
    return it("should send 'adb get-devpath' <right>", function() {
      return client.getDevicePath('123456', function(err, data) {
        if (err === null) {
          return expect(data).to.equal('usb:1-1');
        } else {
          expect(err).to.be.an["instanceof"](Error);
          return expect(err.message).to.equal('unknown');
        }
      }).then(function(data) {
        return expect(data).to.equal('usb:1-1');
      })["catch"](function(err) {
        expect(err).to.be.an["instanceof"](Error);
        return expect(err.message).to.equal('unknown');
      });
    });
  });

}).call(this);

//# sourceMappingURL=GetDevicePathCommand.js.map