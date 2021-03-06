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

  describe('GetStateCommand', function() {
    return it("should send 'adb get-state' <right>", function() {
      return client.getState('123456', function(err, data) {
        if (err === null) {
          return expect(data).to.equal('device');
        } else {
          expect(err).to.be.an["instanceof"](Error);
          return expect(err.message).to.equal('error: unknown');
        }
      }).then(function(data) {
        return expect(data).to.equal('device');
      })["catch"](function(err) {
        expect(err).to.be.an["instanceof"](Error);
        return expect(err.message).to.equal('error: unknown');
      });
    });
  });

}).call(this);

//# sourceMappingURL=GetStateCommand.js.map
