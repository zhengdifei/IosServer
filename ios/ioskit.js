// Generated by CoffeeScript 1.11.1
(function() {
  var Adb, ClearCommand, ForwardCommand, GetDHCPIpAddressCommand, GetDevicePathCommand, GetFeaturesCommand, GetPackagesCommand, GetPropertiesCommand, GetSerialNoCommand, GetStateCommand, InstallCommand, InstallRemoteCommand, IsInstalledCommand, KillCommand, ListDevicesCommand, ListDevicesWithPathsCommand, ListForwardsCommand, OpenLogcatCommand, OpenMonkeyCommand, OpenTcpCommand, Promise, RebootCommand, RemountCommand, ScreencapCommand, ShellCommand, StartActivityCommand, StartServiceCommand, StatCommand, TcpipCommand, UsbCommand, VersionCommand, WaitBootCompleteCommand, WaitForDevibceCommand, WaitForDeviceCommand;

  Promise = require('bluebird');

  WaitForDevibceCommand = require('./lib/WaitForDeviceCommand');

  ListDevicesCommand = require('./lib/ListDevicesCommand');

  GetPropertiesCommand = require('./lib/GetPropertiesCommand');

  ClearCommand = require('./lib/ClearCommand');

  ForwardCommand = require('./lib/ForwardCommand');

  GetDevicePathCommand = require('./lib/GetDevicePathCommand');

  GetDHCPIpAddressCommand = require('./lib/GetDHCPIpAddressCommand');

  GetFeaturesCommand = require('./lib/GetFeaturesCommand');

  GetPackagesCommand = require('./lib/GetPackagesCommand');

  GetSerialNoCommand = require('./lib/GetSerialNoCommand');

  GetStateCommand = require('./lib/GetStateCommand');

  InstallCommand = require('./lib/InstallCommand');

  InstallRemoteCommand = require('./lib/InstallRemoteCommand');

  IsInstalledCommand = require('./lib/IsInstalledCommand');

  KillCommand = require('./lib/KillCommand');

  ListDevicesWithPathsCommand = require('./lib/ListDevicesWithPathsCommand');

  ListForwardsCommand = require('./lib/ListForwardsCommand');

  OpenLogcatCommand = require('./lib/OpenLogcatCommand');

  OpenMonkeyCommand = require('./lib/OpenMonkeyCommand');

  OpenTcpCommand = require('./lib/OpenTcpCommand');

  RebootCommand = require('./lib/RebootCommand');

  RemountCommand = require('./lib/RemountCommand');

  ScreencapCommand = require('./lib/ScreencapCommand');

  ShellCommand = require('./lib/ShellCommand');

  StartActivityCommand = require('./lib/StartActivityCommand');

  StartServiceCommand = require('./lib/StartServiceCommand');

  StatCommand = require('./lib/StatCommand');

  TcpipCommand = require('./lib/TcpipCommand');

  UsbCommand = require('./lib/UsbCommand');

  VersionCommand = require('./lib/VersionCommand');

  WaitBootCompleteCommand = require('./lib/WaitBootCompleteCommand');

  WaitForDeviceCommand = require('./lib/WaitForDeviceCommand');

  Adb = (function() {
    function Adb(options) {
      var host, port;
      host = options.host;
      port = options.port;
    }

    Adb.createClient = function(options) {
      return new Adb(options);
    };

    Adb.prototype.listDevices = function(callback) {
      var resolver;
      resolver = Promise.defer();
      new ListDevicesCommand('adb', 'devices').execute(callback).then(function(serialId) {
        return resolver.resolve(serialId);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.trackDevices = function(callback) {
      var resolver;
      resolver = Promise.defer();
      new WaitForDevibceCommand('adb', 'wait-for-device').execute('123456', callback).then(function(tracker) {
        return resolver.resolve(tracker);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.getProperties = function(serial, callback) {
      var resolver;
      resolver = Promise.defer();
      new GetPropertiesCommand('adb', 'shell', 'getprop').execute(serial, callback).then(function(properties) {
        return resolver.resolve(properties);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.clear = function(serial, pkg, callback) {
      var resolver;
      resolver = Promise.defer();
      new ClearCommand('adb', 'shell', 'pm', 'clear', pkg).execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.forward = function(serial, local, remote, callback) {
      var resolver;
      resolver = Promise.defer();
      new ForwardCommand('adb', 'forward', local, remote).execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.getDevicePath = function(serial, callback) {
      var resolver;
      resolver = Promise.defer();
      new GetDevicePathCommand('adb', 'get-devpath').execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.getDHCPIpAddress = function(serial, iface, callback) {
      var resolver;
      if (iface == null) {
        iface = 'wlan0';
      }
      resolver = Promise.defer();
      new GetDHCPIpAddressCommand('adb', 'shell', 'getprop', 'dhcp.' + iface + '.ipaddress').execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.getFeatures = function(serial, callback) {
      var resolver;
      resolver = Promise.defer();
      new GetFeaturesCommand('adb', 'shell', 'pm', 'list', 'features').execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.getPackages = function(serial, callback) {
      var resolver;
      resolver = Promise.defer();
      new GetPackagesCommand('adb', 'shell', 'pm', 'list', 'packages').execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.getSerialNo = function(serial, callback) {
      var resolver;
      resolver = Promise.defer();
      new GetSerialNoCommand('adb', 'get-serialno').execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.getState = function(serial, callback) {
      var resolver;
      resolver = Promise.defer();
      new GetStateCommand('adb', 'get-state').execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.install = function(serial, apk, callback) {
      var resolver;
      resolver = Promise.defer();
      new InstallCommand('adb', 'install', apk).execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.installRemote = function(serial, apk, callback) {
      var resolver;
      resolver = Promise.defer();
      new InstallRemoteCommand('adb', 'shell', 'pm', 'install', '-r', apk).execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.isInstalled = function(serial, apk, callback) {
      var resolver;
      resolver = Promise.defer();
      new IsInstalledCommand('adb', 'shell', 'pm', 'path', apk).execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.kill = function(callback) {
      var resolver;
      resolver = Promise.defer();
      new KillCommand('adb', 'kill-server').execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.listDevicesWithPaths = function(callback) {
      var resolver;
      resolver = Promise.defer();
      new KillCommand('adb', 'devices', 'get-devpath').execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.listForwards = function(serial, callback) {
      var resolver;
      resolver = Promise.defer();
      new ListForwardsCommand('adb', 'forward', '--list').execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.openLocal = function(serial, path, callback) {
      var resolver;
      resolver = Promise.defer();
      new OpenLocalCommand.execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.openLog = function(serial, name, callback) {
      var resolver;
      resolver = Promise.defer();
      new OpenLocalCommand.execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.openLogcat = function(serial, options, callback) {
      var resolver;
      resolver = Promise.defer();
      new OpenLogcatCommand.execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.openMonkey = function(serial, port, callback) {
      var resolver;
      resolver = Promise.defer();
      new OpenMonkeyCommand.execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.openTcp = function(serial, port, host, callback) {
      var resolver;
      resolver = Promise.defer();
      new OpenMonkeyCommand.execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.reboot = function(serial, callback) {
      var resolver;
      resolver = Promise.defer();
      new RebootCommand('adb', 'reboot').execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.remount = function(serial, callback) {
      var resolver;
      resolver = Promise.defer();
      new RemountCommand('adb', 'remount').execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.screencap = function(serial, callback) {
      var resolver;
      resolver = Promise.defer();
      new ScreencapCommand('adb', 'shell', 'screencap', '-p').execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.shell = function(serial, command, callback) {
      var resolver;
      resolver = Promise.defer();
      new ShellCommand('adb', 'shell', command).execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.startActivity = function(serial, options, callback) {
      var resolver;
      resolver = Promise.defer();
      new StartActivityCommand('adb', 'shell', 'am', 'start', options).execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.startService = function(serial, options, callback) {
      var resolver;
      resolver = Promise.defer();
      new StartServiceCommand('adb', 'shell', 'am', 'startservice', options).execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.stat = function(serial, path, callback) {
      var resolver;
      resolver = Promise.defer();
      new StatCommand.execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.tcpip = function(serial, port, callback) {
      var resolver;
      resolver = Promise.defer();
      new TcpipCommand.execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.uninstall = function(serial, port, callback) {
      var resolver;
      resolver = Promise.defer();
      new UninstallCommand.execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.version = function(callback) {
      var resolver;
      resolver = Promise.defer();
      new VersionCommand.execute(callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.waitBootComplete = function(serial, callback) {
      var resolver;
      resolver = Promise.defer();
      new WaitBootCompleteCommand.execute(callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    Adb.prototype.waitForDevice = function(serial, callback) {
      var resolver;
      resolver = Promise.defer();
      new WaitForDeviceCommand('adb', '-s', serial, 'wait-for-device').execute(serial, callback).then(function(isSuccess) {
        return resolver.resolve(isSuccess);
      })["catch"](function(err) {
        return resolver.reject(err);
      });
      return resolver.promise;
    };

    return Adb;

  })();

  module.exports = Adb;

}).call(this);

//# sourceMappingURL=adb.js.map