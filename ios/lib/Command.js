// Generated by CoffeeScript 1.11.1
(function() {
  var Command, Promise,
    slice = [].slice;

  Promise = require('bluebird');

  Command = (function() {
    function Command() {
      var args, cmd;
      cmd = arguments[0], args = 2 <= arguments.length ? slice.call(arguments, 1) : [];
      this.cmd = cmd;
      this.args = args;
    }

    Command.prototype.execute = function(serial, callback) {
      var error, resolver;
      error = new Error('the command is not support');
      resolver = Promise.defer();
      resolver.reject(error);
      return resolver.promise["finally"](function() {
        return callback(error);
      });
    };

    return Command;

  })();

  module.exports = Command;

}).call(this);

//# sourceMappingURL=Command.js.map
