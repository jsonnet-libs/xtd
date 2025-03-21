local xtd = import '../main.libsonnet';
local test = import 'github.com/jsonnet-libs/testonnet/main.libsonnet';

test.new(std.thisFile)
+ test.case.new(
  name='empty',
  test=test.expect.eq(
    actual=xtd.string.capitalize(''),
    expected='',
  )
)

+ test.case.new(
  name='abc',
  test=test.expect.eq(
    actual=xtd.string.capitalize('abc'),
    expected='Abc',
  )
)
