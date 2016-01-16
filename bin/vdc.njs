#!/usr/bin/env node
/* js-vdc (C) 2013-present SheetJS -- http://sheetjs.com */
var vdc = require('../');
require('exit-on-epipe');
var program = require('commander');
program
	.version("1.0")
	.usage('[options]')
	.option('-b, --base <base>', 'base (default 2)', 2)
	.option('-N, --start <N>', 'starting index (default 0)', 0)
	.option('-n, --end <n>', 'ending index (default 10)', 10)

program.parse(process.argv);

var die = function(msg, code) { console.error(msg); process.exit(code||1); };

var b = +program.base, N = +program.start, n = +program.end;
if((b!=b)||!(b==(b|0))||b<2) die("base must be a positive integer >= 2");
if((N!=N)||!(N==(N|0))||N<0) die("start must be a nonnegative integer");
if((n!=n)||!(n==(n|0))||n<0) die("end must be a nonnegative integer");

if(N >= n) die("end must exceed start");

var x = new vdc({b:b, n:N});
while(N++ < n) console.log(x.next());
