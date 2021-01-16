local xtd = import './main.libsonnet';

local trace(v) = std.trace(v, v);

// TestEscapeString
local TestEscapeString =
  local name(case) = 'TestEscapeString:%s failed' % case;

  assert xtd.url.escapeString('')
         == ''
         : name('empty');

  assert xtd.url.escapeString('abc')
         == 'abc'
         : name('abc');

  assert xtd.url.escapeString('one two')
         == 'one%20two'
         : name('space');

  assert xtd.url.escapeString('10%')
         == '10%25'
         : name('percent');

  assert xtd.url.escapeString(" ?&=#+%!<>#\"{}|\\^[]`☺\t:/@$'()*,;")
         == '%20%3F%26%3D%23%2B%25%21%3C%3E%23%22%7B%7D%7C%5C%5E%5B%5D%60%E2%98%BA%09%3A%2F%40%24%27%28%29%2A%2C%3B'
         : name('complex');

  assert xtd.url.escapeString("hello, world", [","])
         == 'hello,%20world'
         : name('exclusions');

  assert xtd.url.escapeString("hello, world,&", [",", '&'])
         == 'hello,%20world,&'
         : name('multiple exclusions');
  true;

local TestEncodeQuery =
  local name(case) = 'TestEncodeQuery:%s failed' % case;

  assert xtd.url.encodeQuery({}) == '' : name('empty');

  assert xtd.url.encodeQuery({ q: 'puppies', oe: 'utf8' })
         == 'oe=utf8&q=puppies'
         : name('simple');
  true;

true
&& TestEscapeString
&& TestEncodeQuery
