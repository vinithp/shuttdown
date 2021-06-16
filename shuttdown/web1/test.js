#!/usr/bin/node

const { spawn } = require("child_process");

spawn("ping", ["google.com"]);

console.log("-----------hi")
