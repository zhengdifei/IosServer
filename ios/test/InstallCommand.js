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

  describe('InstallCommand', function() {
    return it("should send 'ideviceinstaller -i path' <right>", function() {
      return client.install('123456', '/Users/yuyue/IosServer/luobo.ipa', function(err, data) {
        if (err === null) {
          return expect(data).to["true"];
        } else {
          expect(err).to.be.an["instanceof"](Error);
          return expect(err.message).to.equal('No such file or directory');
        }
      }).then(function(data) {
        return expect(data).to["true"];
      })["catch"](function(err) {
        expect(err).to.be.an["instanceof"](Error);
        return expect(err.message).to.equal('No such file or directory');
      });
    });
  });

}).call(this);

//# sourceMappingURL=InstallCommand.js.map
