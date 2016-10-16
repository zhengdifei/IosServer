// Generated by CoffeeScript 1.11.1
(function() {
  var ChildProcess, Command, ListDevicesCommand, Promise,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  Promise = require('bluebird');

  Command = require('./Command');

  ChildProcess = require('child_process');

  ListDevicesCommand = (function(superClass) {
    extend(ListDevicesCommand, superClass);

    function ListDevicesCommand() {
      return ListDevicesCommand.__super__.constructor.apply(this, arguments);
    }

    ListDevicesCommand.prototype.execute = function(callback) {
      var action, isSuccess, resolver, returnValue, spawn;
      resolver = Promise.defer();
      spawn = ChildProcess.spawn;
      action = spawn(this.cmd, this.args);
      isSuccess = null;
      returnValue = '';
      action.stdout.on('data', function(data) {
        var serialInfo;
        serialInfo = new Buffer(data).toString().trim();
        if (serialInfo !== null) {
          returnValue = serialInfo;
          return resolver.resolve(returnValue);
        } else {
          isSuccess = new Error('can\'t find a device');
          return resolver.reject(isSuccess);
        }
      });
      action.stderr.on('data', function(data) {
        isSuccess = true;
        return resolver.reject(new Buffer(data).toString());
      });
      action.on('close', function(data) {
        isSuccess = true;
        return resolver.resolve('close');
      });
      return resolver.promise["finally"](function() {
        return callback(isSuccess, returnValue);
      });
    };

    return ListDevicesCommand;

  })(Command);

  module.exports = ListDevicesCommand;

}).call(this);

//# sourceMappingURL=ListDevicesCommand.js.map
