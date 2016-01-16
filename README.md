# VDC

Pure JS implementation of van der Corput low-discrepancy sequences.

## Installation

Available on [npm vdc](http://npm.im/vdc):

```
$ npm install vdc
```

## Usage 

The exported function `VDC` accepts a `opts` object with the following fields:

- `b` (default `2`) base for the sequence.
- `n` (default `0`) starting index for the sequence.

Calling without arguments will default to the aforementioned values.

The object returned by `VDC` exposes a `next()` method to get the next element. 

The field `last` holds the most recently generated value (accessing the field
does not trigger a recalculation)

## Sample Session

```
var VDC = require('vdc')

var opts = {'n':0, 'b':2};
var generator = VDC(opts);
for(var i = 0; i != 10; ++i) console.log(generator.next());
```

The expected output is

```
0       (0/1)
0.5     (1/2)
0.25    (1/4)
0.75    (3/4)
0.125   (1/8)
0.625   (5/8)
0.375   (3/8)
0.875   (7/8)
0.0625  (1/16)
0.5625  (9/16)
```

## Notes

`0` is the first value.  Some sources (notably Wikipedia) start the sequence at
`1/2`, but others (Glasserman "Monte Carlo Methods in Financial Engineering")
claim that the original sequence definition started at `0`.

## License

Please consult the attached LICENSE file for details.  All rights not explicitly
granted by the Apache 2.0 license are reserved by the Original Author.

## Badges

[![Build Status](https://travis-ci.org/SheetJS/js-vdc.svg?branch=master)](https://travis-ci.org/SheetJS/js-vdc)

[![Coverage Status](http://img.shields.io/coveralls/SheetJS/js-vdc/master.svg)](https://coveralls.io/r/SheetJS/js-vdc?branch=master)

[![Analytics](https://ga-beacon.appspot.com/UA-36810333-1/SheetJS/js-vdc?pixel)](https://github.com/SheetJS/js-vdc)
