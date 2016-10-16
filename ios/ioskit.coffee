Promise = require 'bluebird'
WaitForDevibceCommand = require './lib/WaitForDeviceCommand'
ListDevicesCommand = require './lib/ListDevicesCommand'
GetPropertiesCommand = require './lib/GetPropertiesCommand'
ClearCommand = require './lib/ClearCommand'
ForwardCommand = require './lib/ForwardCommand'
GetDevicePathCommand = require './lib/GetDevicePathCommand'
GetDHCPIpAddressCommand = require './lib/GetDHCPIpAddressCommand'
GetFeaturesCommand = require './lib/GetFeaturesCommand'
GetPackagesCommand = require './lib/GetPackagesCommand'
GetSerialNoCommand = require './lib/GetSerialNoCommand'
GetStateCommand = require './lib/GetStateCommand'
InstallCommand = require './lib/InstallCommand'
InstallRemoteCommand = require './lib/InstallRemoteCommand'
IsInstalledCommand = require './lib/IsInstalledCommand'
KillCommand = require './lib/KillCommand'
ListDevicesWithPathsCommand = require './lib/ListDevicesWithPathsCommand'
ListForwardsCommand = require './lib/ListForwardsCommand'
OpenLogcatCommand = require './lib/OpenLogcatCommand'
OpenMonkeyCommand = require './lib/OpenMonkeyCommand'
OpenTcpCommand = require './lib/OpenTcpCommand'
RebootCommand = require './lib/RebootCommand'
RemountCommand = require './lib/RemountCommand'
ScreencapCommand = require './lib/ScreencapCommand'
ShellCommand = require './lib/ShellCommand'
StartActivityCommand = require './lib/StartActivityCommand'
StartServiceCommand = require './lib/StartServiceCommand'
StatCommand = require './lib/StatCommand'
TcpipCommand = require './lib/TcpipCommand'
UsbCommand = require './lib/UsbCommand'
VersionCommand = require './lib/VersionCommand'
WaitBootCompleteCommand = require './lib/WaitBootCompleteCommand'
WaitForDeviceCommand = require './lib/WaitForDeviceCommand'

class Ioskit
  constructor : (options) ->
    host = options.host
    port = options.port
  #创建adb实例
  @createClient : (options) ->
    new Ioskit options
  #列出设备
  listDevices : (callback) ->
    resolver = Promise.defer()
    new ListDevicesCommand 'Idevice_id','-l'
      .execute(callback)
      .then (serialId) ->
        resolver.resolve serialId
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #跟踪设备
  trackDevices : (callback) ->
    resolver = Promise.defer()
    new WaitForDevibceCommand 'adb','wait-for-device'
      .execute('123456',callback)
      .then (tracker) ->
        resolver.resolve tracker
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #获取设备信息
  getProperties : (serial,callback) ->
    resolver = Promise.defer()
    new GetPropertiesCommand 'ideviceinfo','-u',serial
      .execute(serial,callback)
      .then (properties) ->
        resolver.resolve properties
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #清理apk的数据
  clear : (serial,pkg,callback) ->
    resolver = Promise.defer()
    new ClearCommand 'adb','shell','pm','clear',pkg
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #与手机建立socket，映射本地端口
  forward : (serial,local,remote,callback) ->
    resolver = Promise.defer()
    new ForwardCommand 'adb','forward',local,remote
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #获取设备路径
  getDevicePath : (serial,callback) ->
    resolver = Promise.defer()
    new GetDevicePathCommand 'adb','get-devpath'
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #返回设备IP
  getDHCPIpAddress : (serial,iface='wlan0',callback) ->
    resolver = Promise.defer()
    new GetDHCPIpAddressCommand 'adb','shell','getprop','dhcp.'+iface+'.ipaddress'
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #返回设备特征
  getFeatures : (serial,callback) ->
    resolver = Promise.defer()
    new GetFeaturesCommand 'adb','shell','pm','list','features'
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #返回设备程序包
  getPackages : (serial,callback) ->
    resolver = Promise.defer()
    new GetPackagesCommand 'adb','shell','pm','list','packages'
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #返回设备serial number
  getSerialNo : (serial,callback) ->
    resolver = Promise.defer()
    new GetSerialNoCommand 'adb','get-serialno'
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #返回设备状态
  getState : (serial,callback) ->
    resolver = Promise.defer()
    new GetStateCommand 'adb','get-state'
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #安装apk
  install : (serial,apk,callback) ->
    resolver = Promise.defer()
    new InstallCommand 'ideviceinstaller','-i',apk
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #安装apk
  installRemote : (serial,apk,callback) ->
    resolver = Promise.defer()
    new InstallRemoteCommand 'adb','shell','pm','install','-r',apk
    .execute(serial,callback)
    .then (isSuccess) ->
      resolver.resolve isSuccess
    .catch (err) ->
      resolver.reject err
    resolver.promise
  #安装apk
  isInstalled : (serial,apk,callback) ->
    resolver = Promise.defer()
    new IsInstalledCommand 'adb','shell','pm','path',apk
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #停止adb server
  kill : (callback) ->
    resolver = Promise.defer()
    new KillCommand 'adb','kill-server'
    .execute(serial,callback)
    .then (isSuccess) ->
      resolver.resolve isSuccess
    .catch (err) ->
      resolver.reject err
    resolver.promise
  #显示连接的设备集
  listDevicesWithPaths : (callback) ->
    resolver = Promise.defer()
    new KillCommand 'adb','devices','get-devpath'
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #显示设备forward映射
  listForwards : (serial,callback) ->
    resolver = Promise.defer()
    new ListForwardsCommand 'adb','forward','--list'
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #在设备上，直接建立socket连接
  openLocal : (serial,path,callback) ->
    resolver = Promise.defer()
    new OpenLocalCommand
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #在设备上，开启一个二进制log文件
  openLog : (serial,name,callback) ->
    resolver = Promise.defer()
    new OpenLocalCommand
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #在设备上，开启一个Logcat
  openLogcat : (serial,options,callback) ->
    resolver = Promise.defer()
    new OpenLogcatCommand
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #在设备上，开启一个Monkey
  openMonkey : (serial,port,callback) ->
    resolver = Promise.defer()
    new OpenMonkeyCommand
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #在设备上，开启一个TCP
  openTcp : (serial,port,host,callback) ->
    resolver = Promise.defer()
    new OpenMonkeyCommand
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #重启设备adb reboot
  reboot : (serial,callback) ->
    resolver = Promise.defer()
    new RebootCommand 'adb','reboot'
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #remount
  remount : (serial,callback) ->
    resolver = Promise.defer()
    new RemountCommand 'adb','remount'
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #screenshot in PNG
  screencap : (serial,callback) ->
    resolver = Promise.defer()
    new ScreencapCommand 'adb','shell','screencap','-p'
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #执行shell
  shell : (serial,command,callback) ->
    resolver = Promise.defer()
    new ShellCommand 'adb','shell',command
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #配置激活
  startActivity : (serial,options,callback) ->
    resolver = Promise.defer()
    new StartActivityCommand 'adb','shell','am','start',options
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #启动服务
  startService : (serial,options,callback) ->
    resolver = Promise.defer()
    new StartServiceCommand 'adb','shell','am','startservice',options
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #启动服务
  stat : (serial,path,callback) ->
    resolver = Promise.defer()
    new StatCommand
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #改变设备连接模式为tcp
  tcpip : (serial,port,callback) ->
    resolver = Promise.defer()
    new TcpipCommand
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #卸载一个apk
  uninstall : (serial,port,callback) ->
    resolver = Promise.defer()
    new UninstallCommand
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #查询adb server的版本信息
  version : (callback) ->
    resolver = Promise.defer()
    new VersionCommand
      .execute(callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #Waits until the device has finished booting
  waitBootComplete : (serial,callback) ->
    resolver = Promise.defer()
    new WaitBootCompleteCommand
      .execute(callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise
  #adb server 等待发现设备
  waitForDevice : (serial,callback) ->
    resolver = Promise.defer()
    new WaitForDeviceCommand 'adb','-s',serial,'wait-for-device'
      .execute(serial,callback)
      .then (isSuccess) ->
        resolver.resolve isSuccess
      .catch (err) ->
        resolver.reject err
    resolver.promise

module.exports = Ioskit