/* Copyright (C) 2013  SheetJS */
/* vim: set ts=2: */
var VDC;
var fs = require('fs'), assert = require('assert');
describe('source', function() { it('should load', function() { VDC = require('./'); }); });

var files = (fs.existsSync('tests.lst') ? fs.readFileSync('tests.lst', 'utf-8').split("\n") : fs.readdirSync('test_files')).filter(function(x){return x.substr(0,9)=="baseline.";});

describe('should reproduce baselines', function() {
	files.forEach(function(x) {
		var d = x.substr(9).split("."), base = d[0], elts = d[1];
		it("base=" + base + " elts=" + elts, function() {
			var opts = {'n':1,'b':base};
			var gen = VDC(opts);
			var data = fs.readFileSync('./test_files/' + x, 'utf-8').split("\n").filter(function(x) { return x.length > 1; });
			for(var i = 1; i <= elts; ++i) assert.equal((i +"\t"+ gen.next().toFixed(6)).slice(0,-1),data[i-1].slice(0,-1));
		});
	});
});
