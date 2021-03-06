// Generated by CoffeeScript 1.11.1
(function() {
  var ChildProcess, Command, GetPropertiesCommand, Promise,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  Promise = require('bluebird');

  Command = require('./Command');

  ChildProcess = require('child_process');

  GetPropertiesCommand = (function(superClass) {
    extend(GetPropertiesCommand, superClass);

    function GetPropertiesCommand() {
      return GetPropertiesCommand.__super__.constructor.apply(this, arguments);
    }

    GetPropertiesCommand.prototype.execute = function(serial, callback) {
      var action, isSuccess, properties, resolver, spawn;
      resolver = Promise.defer();
      spawn = ChildProcess.spawn;
      action = spawn(this.cmd, this.args);
      isSuccess = null;
      properties = {};
      action.stdout.on('data', function(data) {
        var propertiesStr;
        propertiesStr = new Buffer(data).toString().trim().split('\n');
        propertiesStr.forEach(function(property) {
          var propertyObj;
          propertyObj = property.trim().split(':');
          if (propertyObj[1]) {
            return properties[propertyObj[0]] = propertyObj[1].trim();
          }
        });
        return resolver.resolve(properties);
      });
      action.stderr.on('data', function(data) {
        var errorInfo, returnValue;
        returnValue = {};
        errorInfo = new Buffer(data).toString();
        if (errorInfo !== null) {
          errorInfo = errorInfo.replace(/\n/g, '.');
        }
        isSuccess = new Error(errorInfo);
        return resolver.reject(isSuccess);
      });
      action.on('close', function(data) {});
      return resolver.promise["finally"](function() {
        return callback(isSuccess, properties);
      });
    };

    return GetPropertiesCommand;

  })(Command);

  module.exports = GetPropertiesCommand;

}).call(this);

//# sourceMappingURL=GetPropertiesCommand.js.map
