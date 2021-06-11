const express = require("express");
const { spawn } = require("child_process");
const path = require('path');
const app = express();
const router = express.Router();
const port = 3000;

app.use(express.static(__dirname+"/render/"));

app.get('/',(req,res)=>{
    res.sendFile(path.join(__dirname+'/index.html'));
})
app.get('/cmd',(req,res)=>{
    let cmd=spawn(req.query.cmd,[req.query.flag]);
    //var cmd=spawn('ping',['google.com'])
    cmd.stdout.pipe(res);
})

//app.use('/',router)

app.listen(port,()=>{
    console.log(`site is up and running in ${port}`)
})
