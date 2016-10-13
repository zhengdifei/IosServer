const adb = require('../client/adb').createClient({host:'localhost',port:5078})
//测试listDevices
/*adb.listDevices().then(function(data){
    console.log(data)
})*/

adb.trackDevices(function(err,tracker){
    console.log('find device')
}).then(function(tracker){
    tracker.on("add",function(){
        console.log("add device")
        adb.listDevices(function(err,serial){
            console.log("show device serial")
        }).then(function(data){
            console.log("serialId:",data)
        })
    })
})

//adb.getProperties('zdf',function(properties){
//    console.log('1',properties)
//}).then(function(properties){
//    console.log('2',properties)
//})