// Generated by CoffeeScript 1.11.1
(function() {
  var ChildProcess, Command, GetStateCommand, Promise,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  Promise = require('bluebird');

  Command = require('./Command');

  ChildProcess = require('child_process');

  GetStateCommand = (function(superClass) {
    extend(GetStateCommand, superClass);

    function GetStateCommand() {
      return GetStateCommand.__super__.constructor.apply(this, arguments);
    }

    GetStateCommand.prototype.execute = function(serial, callback) {
      var action, isSuccess, resolver, returnValue, spawn;
      resolver = Promise.defer();
      spawn = ChildProcess.spawn;
      action = spawn(this.cmd, this.args);
      isSuccess = null;
      returnValue = '';
      action.stdout.on('data', function(data) {
        returnValue = new Buffer(data).toString();
        returnValue = returnValue.replace(/\n/g, '');
        if (returnValue.indexOf('unknown') > -1) {
          isSuccess = new Error('error: unknown');
          return resolver.reject(isSuccess);
        } else {
          return resolver.resolve(returnValue);
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
      action.on('close', function(data) {});
      return resolver.promise["finally"](function() {
        return callback(isSuccess, returnValue);
      });
    };

    return GetStateCommand;

  })(Command);

  module.exports = GetStateCommand;

}).call(this);

//# sourceMappingURL=GetStateCommand.js.map
