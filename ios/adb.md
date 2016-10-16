# ZDF AdbKit
    直接调用adb api命令，返回Android设备的基本信息，可以进行交换。
## API
#### adb.createClient([options])
创建与adb的连接
* **options**
    - **host** ip地址
    - **port** 端口号
* Return:The client instance

### Client
#### client.listDevices([callback])
列出所有设备列表，返回 **serialId**列表`adb devices`
* callback : 返回serialId之后，才知晓callback
* Return : Promise
* Resolves with : serialId

#### client.clear(serial,pkg[,callback])
清理设备上某个应用数据 `adb shell pm clear <pkg>`
* **serial** 设备serial
* **pkg** package名称
* **callback** 回调函数
* Returns : Promise
* Resolves with : true

#### client.forward(serial,local,remote[,callback])
将ADB与手机建立socket连接，映射到本地socket端口 `adb forward <local> <remote>`
* **serial**
* **local**
  - tcp:port
* **remote**
* **callback**
* Returns : Promise
* Resolves with : true

#### client.getDevicePath(serial[,callback])
获取设备路径`adb get-devpath`
* **serial**
* **callback**
* Returns : Promise
* Resolves with : path

#### client.getDHCPIpAddress(serial[,iface,callback])
返回设备IP `adb shell getprop dhcp.<iface>.ipaddress`
* **serial**
* **iface** 网络接口，默认值“wlan0”
* **callback**
* Returns ：Promise
* Resolves : ip

#### client.getFeatures(serial[,callback])
返回设备特征 `adb shell pm list features`
* **serial**
* **callback**
* Returns ：Promise
* Resolves : features

#### client.getPackage(serial[,callback])
返回设备程序包 `adb shell pm list packages`
* **serial**
* **callback**
* Returns ：Promise
* Resolves : packages

#### client.getProperties(serial[,callback])
返回设备属性 `adb shell getprop`
* **serial**
* **callback**
* Returns ：Promise
* Resolves : properties

#### client.getSerialNo(serial[,callback])
返回设备serial number 从`adb devices`里面获取到，没有具体用处`adb get-serialno`可用
* **serial**
* **callback**
* Returns ：Promise
* Resolves : serial

#### client.getState(serial[,callback])
返回设备状态`adb get-state`
* **serial**
* **callback**
* Returns ：Promise
* Resolves : state（device,offline）

#### client.install(serial,apk[,callback])
返回设备状态`adb install [-l] [-r] [-s] [--algo <algorithm name> --key <hex-encoded key> --iv <hex-encoded iv>] <file>`
* **serial**
* **apk** string:apk路径安装，stream:直接用流方式安装
* **callback**
* Returns ：Promise
* Resolves : true

#### client.installRemote(serial,apk[,callback])
安装apk，apk文件必须位于设备`adb shell pm install -r <apk>` followed by `adb shell rm -f <apk>`.
* **serial**
* **apk** string:apk路径安装
* **callback**
* Returns ：Promise
* Resolves : true

#### client.isInstalled(serial,apk[,callback])
判断apk是否安装，`adb shell pm path <pkg>`
* **serial**
* **apk** apk名称
* **callback**
* Returns ：Promise
* Resolves : true

#### client.kill([callback])
kill adb server，`adb kill-server`
* **callback**
* Returns ：Promise
* Resolves : true

#### client.listDevices([callback])
显示连接的设备集`adb devices`
* **callback**
* Returns ：Promise
* Resolves : devices

#### client.listDevicesWithPaths([callback])
显示连接的设备集（包括路径）`adb devices` && `adb get-devpath`
* **callback**
* Returns ：Promise
* Resolves : devices(id,type,path)

#### client.listForwards(serial[,callback])
显示设备forward映射`adb forward --list`
* **callback**
* **serial**
* Returns ：Promise
* Resolves : devices(id,type,path)

#### client.openLocal(serial,path[,callback])
在设备上，直接建立socket连接，
* **serial**
* **path** `localfilesystem:`
* **callback**
* Returns ：Promise
* Resolves : conn

#### client.openLog(serial,name[,callback])
在设备上，开启一个二进制log文件，
* **serial**
* **name**  Available logs include 'main', 'system', 'radio' and 'events'.
* **callback**
* Returns ：Promise
* Resolves : log

#### client.openLogcat(serial[,options][,callback])
在设备上，开启一个二进制log文件，
* **serial**
* **options** clear When true, clears logcat before opening the reader. Not set by default.
* **callback**
* Returns ：Promise
* Resolves : logcat

#### client.openMonkey(serial[,port][,callback])
在设备上，开启一个二进制log文件，
* **serial**
* **port** The device port where you'd like Monkey to run at. Defaults to 1080
* **callback**
* Returns ：Promise
* Resolves : monkey

#### client.openProcStat(serial[,callback]) __??__

#### client.openTcp(serial,port[,host][,callback])
直接与设备建立TCP连接
* **serial**
* **port**
* **host**
* **callback**
* Returns ：Promise
* Resolves : conn

#### client.pull(serial,path[,callback])
sysc.pull
* **serial**
* **path**
* **callback**
* Returns ：Promise
* Resolves : tranfer

#### client.push(serial,contents,path[,mode][,callback])
sysc.push
* **serial**
* **contents**
* **path**
* **callback**
* Returns ：Promise
* Resolves : tranfer

#### client.readdir(serial,path[,callback])
sysc.readdir
* **serial**
* **path**
* **callback**
* Returns ：Promise
* Resolves : tranfer

#### client.reboot(serial[,callback])
重启设备`adb reboot`
* **serial**
* **callback**
* Returns ：Promise
* Resolves : true

#### client.remount(serial[,callback])
remount the /system partition in read-write mode
* **serial**
* **callback**
* Returns ：Promise
* Resolves : true

#### client.screencap(serial[,callback])
Takes a screenshot in PNG format using the built-in screencap utility`adb shell screencap -p`
* **serial**
* **callback**
* Returns ：Promise
* Resolves : screencap (PNG stream)

#### client.shell(serial,command[,callback])
在设备上，执行命令
* **serial**
* **command**
* **callback**
* Returns ：Promise
* Resolves : screencap (PNG stream)

#### client.startActivity(serial,options[,callback])
                 在设备上,配置激活`adb shell am start <options>`
                 * **serial**
                 * **options**
                 * **callback**
                 * Returns ：Promise
                 * Resolves : true

#### client.startService(serial,options[,callback])
在设备上，启动服务`adb shell am startservice <options>`
* **serial**
* **options**
* **callback**
* Returns ：Promise
* Resolves : true

#### client.stat(serial,path[,callback])
sync.stat
* **serial**
* **options**
* **callback**
* Returns ：Promise
* Resolves : true

#### client.stat(serial[,callback])
using client.stat(), client.push() and client.pull().
* **serial**
* **callback**
* Returns ：Promise
* Resolves : sync

#### client.tcpip(serial,port[,callback])
改变设备连接模式为tcp，通过adb connect进行连接
* **serial**
* **port**
* **callback**
* Returns ：Promise
* Resolves : port

#### client.trackDevices([callback])
返回tracker，devices are added, removed, or their type changes
* **callback**
* Returns ：Promise
* Resolves : tracker(event:add,remove,change,end,error)

#### client.trackJdwp(serial[,callback])
Starts a JDWP tracker for the given device.
* **serial**
* **callback**
* Returns ：Promise
* Resolves : tracker(event:add,remove,end,error)

#### client.uninstall(serial,pkg[,callback])
卸载一个apk
* **serial**
* **pkg**
* **callback**
* Returns ：Promise
* Resolves : true

#### client.usb(serial[,callback])
通过usb连接设备
* **serial**
* **callback**
* Returns ：Promise
* Resolves : true

#### client.version([callback])
查询adb server的版本信息
* **callback**
* Returns ：Promise
* Resolves : version

#### client.waitBootComplete(serial[,callback])
Waits until the device has finished booting.checking  `adb shell getprop sys.boot_completed`
* **serial**
* **callback**
* Returns ：Promise
* Resolves : true

#### client.waitForDevice(serial[,callback])
adb server 等待发现设备`adb -s serial wait-for-device`
* **serial**
* **callback**
* Returns ：Promise
* Resolves : id




