local xtd = import './main.libsonnet';

local trace(v) = std.trace(v,v);

local TestEscapeString =
  true

  && xtd.url.escapeString('')
     == ''

  && xtd.url.escapeString('abc')
     == 'abc'

  && xtd.url.escapeString('one two')
     == 'one%20two'

  && xtd.url.escapeString('10%')
     == '10%25'

  && xtd.url.escapeString(" ?&=#+%!<>#\"{}|\\^[]`☺\t:/@$'()*,;")
     == '%20%3F%26%3D%23%2B%25%21%3C%3E%23%22%7B%7D%7C%5C%5E%5B%5D%60%E2%98%BA%09%3A%2F%40%24%27%28%29%2A%2C%3B'
;

local TestEncodeQuery =
  true

  && xtd.url.encodeQuery({})
     == ''

  && xtd.url.encodeQuery({ q: 'puppies', oe: 'utf8' })
     == 'oe=utf8&q=puppies'
;

local result = true
&& TestEscapeString
&& TestEncodeQuery
;

assert result;
result
