/**
 * Created by Administrator on 2016/10/10 0010.
 */
const spawn = require('child_process').spawn
const ls = spawn('adb',['devices'])

ls.stdout.on('data',(data) => {
    //console.log(`stdout:${data}`)
    const serialInfo = new Buffer(data).toString().trim().split('\n')
    if( serialInfo.length >1){
        const serialId = serialInfo[1].split('\t')[0]
        console.log(serialId)
    }
})

ls.stderr.on('data',(data) => {
    console.log(`stderr:${data}`)
})

ls.on('close',(code) =>{
    console.log(`child process exit with code ${code}`)
})
