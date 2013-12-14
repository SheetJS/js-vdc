function VDC (opts) {
	if(!(this instanceof VDC)) return new VDC(opts);
	var o = opts || {}
	this._b = o.b || 2;
	this.last = 0;
	this.reset(o);
};

VDC.prototype.reset = function(opts) {
	this._n = (opts||{}).n||0;
}

VDC.prototype.next = function() {
	var n = this._n++;
	var p = 0, q = 1;
	while(n >= 1) {
		p = p * this._b + (n % this._b);
		q *= this._b;
		n = (n/this._b)|0;
	}
	return this.last = p / q;
}

if(typeof module !== 'undefined') {
	module.exports = VDC;
}
