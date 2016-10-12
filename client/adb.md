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
列出所有设备列表，返回 **serialId**列表
* callback : 返回serialId之后，才知晓callback
* Return : Promise
* Resolves with : serialId











