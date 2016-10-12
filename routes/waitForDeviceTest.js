/**
 * Created by Administrator on 2016/10/10 0010.
 */
const spawn = require('child_process').spawn
const ls = spawn('adb',['wait-for-device'])

ls.stdout.on('data',(data) => {
    console.log(`stdout:${data}`)
})

ls.stderr.on('data',(data) => {
    console.log(`stderr:${data}`)
})

ls.on('close',(code) =>{
    console.log(`child process exit with code ${code}`)
})
