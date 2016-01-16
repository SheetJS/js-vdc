/* vdc.js (C) 2013-present SheetJS -- http://sheetjs.com */
/* vim: set ts=2: */
/*::
type VDCArgs = {
	b?: number,
	n?: number
};
*/

function VDC (opts/*:?VDCArgs*/) {
	if(!(this instanceof VDC)) return new VDC(opts);
	var o = opts || {b:2, n:0};
	this._b = o.b || 2;
	this._n = 0;
	this.last = 0;
	this.reset(o);
}

VDC.prototype.reset = function(opts/*:?VDCArgs*/) {
	this._n = (opts||{n:0}).n||0;
};

VDC.prototype.next = function()/*:number*/ {
	var n = this._n++;
	var p = 0, q = 1;
	while(n >= 1) {
		p = p * this._b + (n % this._b);
		q *= this._b;
		n = (n/this._b)>>>0;
	}
	this.last = p/q;
	return this.last;
};

if(typeof module !== 'undefined') {
	module.exports = VDC;
}
