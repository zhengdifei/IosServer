const adb = require('../client/adb').createClient({host:'localhost',port:5078})
//测试listDevices
/*adb.listDevices().then(function(data){
    console.log(data)
})*/

adb.trackDevices(function(){
    console.log('find device end')
}).then(function(tracker){
    tracker.on("add",function(){
        console.log("add device")
        adb.listDevices(function(){
            console.log('list device end')
        }).then(function(data){
            console.log("serialId:",data)
        })
    })
})