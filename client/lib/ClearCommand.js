// Generated by CoffeeScript 1.11.1
(function() {
  var ChildProcess, ClearCommand, Command, Promise,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  Promise = require('bluebird');

  Command = require('./Command');

  ChildProcess = require('child_process');

  ClearCommand = (function(superClass) {
    extend(ClearCommand, superClass);

    function ClearCommand() {
      return ClearCommand.__super__.constructor.apply(this, arguments);
    }

    ClearCommand.prototype.execute = function(serial, callback) {
      var action, isSuccess, resolver, returnValue, spawn;
      resolver = Promise.defer();
      spawn = ChildProcess.spawn;
      action = spawn(this.cmd, this.args);
      isSuccess = null;
      returnValue = true;
      action.stdout.on('data', function(data) {
        var result;
        result = new Buffer(data).toString();
        if (result !== null) {
          result = result.replace(/\n/g, '.');
        }
        if (result.indexOf('Success') > -1) {
          returnValue = true;
        } else {
          isSuccess = new Error(result);
          returnValue = false;
        }
        return resolver.resolve(returnValue);
      });
      action.stderr.on('data', function(data) {
        returnValue = new Buffer(data).toString();
        if (returnValue !== null) {
          returnValue = returnValue.replace(/\n/g, '.');
        }
        isSuccess = new Error(returnValue);
        return resolver.reject(isSuccess);
      });
      action.on('close', function(data) {});
      return resolver.promise["finally"](function() {
        return callback(isSuccess, returnValue);
      });
    };

    return ClearCommand;

  })(Command);

  module.exports = ClearCommand;

}).call(this);

//# sourceMappingURL=ClearCommand.js.map
