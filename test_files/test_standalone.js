/* usage: node test_standalone.js [base:2] [nelts:10] */
/* Copyright (C) 2013  SheetJS */
var VDC = require('../')
var args = process.argv.slice(2);
var base = Number(args[0] || 2), nelts = Number(args[1] || 10);
var opts = {'n':1, 'b':base};
var generator = VDC(opts);
for(var i=1; i<=nelts; ++i) console.log(i +"\t"+ generator.next().toFixed(6));
