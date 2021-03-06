// Generated by CoffeeScript 1.11.1
(function() {
  var ChildProcess, Command, IsInstalledCommand, Promise,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  Promise = require('bluebird');

  Command = require('./Command');

  ChildProcess = require('child_process');

  IsInstalledCommand = (function(superClass) {
    extend(IsInstalledCommand, superClass);

    function IsInstalledCommand() {
      return IsInstalledCommand.__super__.constructor.apply(this, arguments);
    }

    IsInstalledCommand.prototype.execute = function(serial, callback) {
      var action, isSuccess, resolver, returnValue, spawn;
      resolver = Promise.defer();
      spawn = ChildProcess.spawn;
      action = spawn(this.cmd, this.args);
      isSuccess = null;
      returnValue = '';
      action.stdout.on('data', function(data) {
        returnValue = new Buffer(data).toString();
        returnValue = returnValue.replace(/\n/g, '');
        returnValue = returnValue.replace(/\r/g, '');
        if (returnValue.indexOf('apk') > -1) {
          return resolver.resolve(returnValue);
        } else if (returnValue.indexOf('can\'t find') > -1) {
          returnValue = "unknown";
          isSuccess = new Error(returnValue);
          return resolver.reject(isSuccess);
        }
      });
      action.stderr.on('data', function(data) {
        var errorInfo;
        errorInfo = new Buffer(data).toString();
        if (errorInfo !== null) {
          errorInfo = errorInfo.replace(/\n/g, '.');
        }
        isSuccess = new Error(errorInfo);
        return resolver.reject(isSuccess);
      });
      return resolver.promise["finally"](function() {
        return callback(isSuccess, returnValue);
      });
    };

    return IsInstalledCommand;

  })(Command);

  module.exports = IsInstalledCommand;

}).call(this);

//# sourceMappingURL=IsInstalledCommand.js.map
