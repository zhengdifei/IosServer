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

  describe('InstallCommand', function() {
    return it("should send 'adb install file' <right>", function() {
      return client.install('123456', '/data/local/tmp/STFserver.apk', function(err, data) {
        if (err === null) {
          return expect(data).to["true"];
        } else {
          expect(err).to.be.an["instanceof"](Error);
          return expect(err.message).to.equal('can\'t find \'/data/local/tmp/STFserver.apk\' to install.');
        }
      }).then(function(data) {
        return expect(data).to["true"];
      })["catch"](function(err) {
        expect(err).to.be.an["instanceof"](Error);
        return expect(err.message).to.equal('can\'t find \'/data/local/tmp/STFserver.apk\' to install.');
      });
    });
  });

}).call(this);

//# sourceMappingURL=InstallCommand.js.map
