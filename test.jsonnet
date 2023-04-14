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

  assert xtd.url.escapeString('hello, world', [','])
         == 'hello,%20world'
         : name('exclusions');

  assert xtd.url.escapeString('hello, world,&', [',', '&'])
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

local TestCamelCaseSplit =
  local name(case) = 'TestCamelCaseSplit:%s failed' % case;
  assert xtd.camelcase.split('')
         == ['']
         : name('nostring');
  assert xtd.camelcase.split('lowercase')
         == ['lowercase']
         : name('lowercase');
  assert xtd.camelcase.split('Class')
         == ['Class']
         : name('Class');
  assert xtd.camelcase.split('MyClass')
         == ['My', 'Class']
         : name('MyClass');
  assert xtd.camelcase.split('MyC')
         == ['My', 'C']
         : name('MyC');
  assert xtd.camelcase.split('HTML')
         == ['HTML']
         : name('HTML');
  assert xtd.camelcase.split('PDFLoader')
         == ['PDF', 'Loader']
         : name('PDFLoader');
  assert xtd.camelcase.split('AString')
         == ['A', 'String']
         : name('AString');
  assert xtd.camelcase.split('SimpleXMLParser')
         == ['Simple', 'XML', 'Parser']
         : name('SimpleXMLParser');
  assert xtd.camelcase.split('vimRPCPlugin')
         == ['vim', 'RPC', 'Plugin']
         : name('vimRPCPlugin');
  assert xtd.camelcase.split('GL11Version')
         == ['GL', '11', 'Version']
         : name('GL11Version');
  assert xtd.camelcase.split('99Bottles')
         == ['99', 'Bottles']
         : name('99Bottles');
  assert xtd.camelcase.split('May5')
         == ['May', '5']
         : name('May5');
  assert xtd.camelcase.split('BFG9000')
         == ['BFG', '9000']
         : name('BFG9000');
  assert xtd.camelcase.split('Two  spaces')
         == ['Two', '  ', 'spaces']
         : name('Two  spaces');
  assert xtd.camelcase.split('Multiple   Random  spaces')
         == ['Multiple', '   ', 'Random', '  ', 'spaces']
         : name('Multiple   Random  spaces');

  // TODO: find or create is(Upper|Lower) for non-ascii characters
  // Something like this for Jsonnet:
  // https://cs.opensource.google/go/go/+/refs/tags/go1.17.3:src/unicode/tables.go
  //assert xtd.camelcase.split('BöseÜberraschung')
  //       == ['Böse', 'Überraschung']
  //       : name('BöseÜberraschung');

  // This doesn't even render in Jsonnet
  //assert xtd.camelcase.split("BadUTF8\xe2\xe2\xa1")
  //       ==  ["BadUTF8\xe2\xe2\xa1"]
  //       : name("BadUTF8\xe2\xe2\xa1");
  true;

local TestInspect =
  local name(case) = 'TestInspect:%s failed' % case;

  assert xtd.inspect.inspect({})
         == {}
         : name('emptyobject');

  assert xtd.inspect.inspect({
           key: 'value',
           hidden_key:: 'value',
           func(value): value,
           hidden_func(value):: value,
         })
         == {
           fields: ['key'],
           hidden_fields: ['hidden_key'],
           functions: ['func'],
           hidden_functions: ['hidden_func'],
         }
         : name('flatObject');

  assert xtd.inspect.inspect({
           nested: {
             key: 'value',
             hidden_key:: 'value',
             func(value): value,
             hidden_func(value):: value,
           },
           key: 'value',
           hidden_func(value):: value,
         })
         == {
           nested: {
             fields: ['key'],
             hidden_fields: ['hidden_key'],
             functions: ['func'],
             hidden_functions: ['hidden_func'],
           },
           fields: ['key'],
           hidden_functions: ['hidden_func'],
         }
         : name('nestedObject');

  assert xtd.inspect.inspect({
           key: 'value',
           nested: {
             key: 'value',
             nested: {
               key: 'value',
             },
           },
         }, maxDepth=1)
         == {
           fields: ['key'],
           nested: {
             fields: ['key', 'nested'],
           },
         }
         : name('maxRecursionDepth');
  true;

local TestIsLeapYear =
  local name(case) = 'TestIsLeapYear:%s failed' % case;

  assert !xtd.date.isLeapYear(1995)
         : name('commonYear');

  assert xtd.date.isLeapYear(1996)
         : name('fourYearCycle');

  assert xtd.date.isLeapYear(2000)
         : name('fourHundredYearCycle');

  assert !xtd.date.isLeapYear(2100)
         : name('hundredYearCycle');

  true;

local TestDayOfWeek =
  local name(case) = 'TestDayOfWeek:%s failed' % case;

  assert xtd.date.dayOfWeek(2000, 1, 1)
         == 6
         : name('leapYearStart');

  assert xtd.date.dayOfWeek(2000, 12, 31)
         == 0
         : name('leapYearEnd');

  assert xtd.date.dayOfWeek(1995, 1, 1)
         == 0
         : name('commonYearStart');

  assert xtd.date.dayOfWeek(2003, 12, 31)
         == 3
         : name('commonYearEnd');

  assert xtd.date.dayOfWeek(2024, 7, 19)
         == 5
         : name('leapYearMid');

  assert xtd.date.dayOfWeek(2023, 6, 15)
         == 4
         : name('commonYearMid');

  true;

local TestDayOfYear =
  local name(case) = 'TestDayOfYear:%s failed' % case;

  assert xtd.date.dayOfYear(2000, 1, 1)
         == 1
         : name('leapYearStart');

  assert xtd.date.dayOfYear(2000, 12, 31)
         == 366
         : name('leapYearEnd');

  assert xtd.date.dayOfYear(1995, 1, 1)
         == 1
         : name('commonYearStart');

  assert xtd.date.dayOfYear(2003, 12, 31)
         == 365
         : name('commonYearEnd');

  assert xtd.date.dayOfYear(2024, 7, 19)
         == 201
         : name('leapYearMid');

  assert xtd.date.dayOfYear(2023, 6, 15)
         == 166
         : name('commonYearMid');

  true;
true
&& TestEscapeString
&& TestEncodeQuery
&& TestCamelCaseSplit
&& TestInspect
&& TestIsLeapYear
&& TestDayOfWeek
&& TestDayOfYear
