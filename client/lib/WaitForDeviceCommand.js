// Generated by CoffeeScript 1.11.1
(function() {
  var ChildProcess, Command, Promise, Tracker, WaitForDeviceCommand,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  Promise = require('bluebird');

  Command = require('./Command');

  ChildProcess = require('child_process');

  Tracker = require('./Tracker');

  WaitForDeviceCommand = (function(superClass) {
    extend(WaitForDeviceCommand, superClass);

    function WaitForDeviceCommand() {
      return WaitForDeviceCommand.__super__.constructor.apply(this, arguments);
    }

    WaitForDeviceCommand.prototype.execute = function(callback) {
      var action, isSuccess, resolver, spawn, tracker;
      resolver = Promise.defer();
      spawn = ChildProcess.spawn;
      action = spawn(this.cmd, this.args);
      isSuccess = null;
      tracker = new Tracker;
      action.on('close', function(data) {
        return tracker.findDevice();
      });
      resolver.resolve(tracker);
      return resolver.promise["finally"](function() {
        return callback(isSuccess, tracker);
      });
    };

    return WaitForDeviceCommand;

  })(Command);

  module.exports = WaitForDeviceCommand;

}).call(this);

//# sourceMappingURL=WaitForDeviceCommand.js.map
