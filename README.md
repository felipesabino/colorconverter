# Color Converter

[![Build Status](https://travis-ci.org/felipesabino/colorconverter.png?branch=master)](https://travis-ci.org/felipesabino/colorconverter)
[![Code Climate](https://codeclimate.com/github/felipesabino/colorconverter.png)](https://codeclimate.com/github/felipesabino/colorconverter)

Easy color conversion between Hex, RGB and CMYK

## Instaling

via [npm](https://npmjs.org/)
```Shell
$ npm install colorconverterjs
```

via [Bower](http://bower.io/)
```Shell
$ bower install colorconverterjs
```

## Using

### Instance methods

```JavaScript
colorconverter.from_rgb({r: 10, g: 20, b:30 }).hex()
// "#0a141e"

colorconverter.from_hex('#0a141e').rgb()
// {r: 10, g: 20, b:30 }

colorconverter.from_hex('#8a796b').cmyk()
// {c: 0, m: 12, y: 22, k: 46 }

colorconverter.from_cmyk({c: 0, m: 12, y: 22, k: 46 }).hex()
// "#8a796b"
```

- Available methods

  - `hex()` - returns a string with a hexadecimal value
  - `rbg()` - returns an object with a RGB value
  - `cmyk()` - returns an object with a CMYK value

### Static methods

```JavaScript
colorconverter.rgb_to_hex({r: 10, g: 20, b:30 })
// "#0a141e"

colorconverter.hex_to_rgb('#0a141e')
// {r: 10, g: 20, b:30 }

colorconverter.hex_to_cmyk('#8a796b')
// {c: 0, m: 12, y: 22, k: 46 }

colorconverter.cmyk_to_hex({c: 0, m: 12, y: 22, k: 46 })
// "#8a796b"
```

- Available conversion methods

  - `rgb_to_hex(object)` - returns a string with a hexadecimal value for the RGB color object
  - `hex_to_rgb(string)` - returns an object with the RGB color values from a Hexadecimal string
  - `cmyk_to_hex(object)` - returns a string with a hexadecimal value for the CMYK color object
  - `hex_to_cmyk(string)` - returns an object with the CMYK color values from a Hexadecimal string

- Available helper methods

  - `from_hex(string)` - creates an instance of the converter using the hexadecimal value received as the seed
  - `from_rgb(object)` - creates an instance of the converter using the RGB object received as the seed
  - `from_cmyk(object)` - creates an instance of the converter using the CMYK object received as the seed

## Manually compile

configure:
```Shell
$ npm install
```

test:
```Shell
$ grunt test
```

compile:
```Shell
$ grunt build
```
