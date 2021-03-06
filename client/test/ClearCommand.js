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

  describe('ClearCommand', function() {
    it("should send 'adb shell pm clear <right pkg>", function() {
      return client.clear('123456', 'com.achievo.vipshop', function(err, data) {
        if (err === null) {
          return expect(data).to["true"];
        } else {
          expect(err).to.be.an["instanceof"](Error);
          return expect(err.message).to.equal('error: device not found.');
        }
      }).then(function(data) {
        return expect(data).to["true"];
      })["catch"](function(err) {
        expect(err).to.be.an["instanceof"](Error);
        return expect(err.message).to.equal('error: device not found.');
      });
    });
    return it("should send 'adb shell pm clear <wrong pkg>", function() {
      return client.clear('123456', 'com.achievo.vipshop1', function(err, data) {
        expect(data).to["false"];
        expect(err).to.be.an["instanceof"](Error);
        if (err.message.indexOf('Failed') > -1) {
          return expect(err.message).to.equal('Failed');
        } else {
          return expect(err.message).to.equal('error: device not found.');
        }
      }).then(function(data) {
        return expect(data).to["false"];
      })["catch"](function(err) {
        expect(err).to.be.an["instanceof"](Error);
        return expect(err.message).to.equal('error: device not found.');
      });
    });
  });

}).call(this);

//# sourceMappingURL=ClearCommand.js.map
