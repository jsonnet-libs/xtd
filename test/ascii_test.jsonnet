local ascii = import '../ascii.libsonnet';
local test = import 'github.com/jsonnet-libs/testonnet/main.libsonnet';

test.new(std.thisFile)

+ test.case.new(
  name='all numeric',
  test=test.expect.eq(
    actual=ascii.isStringNumeric('123'),
    expected=true,
  )
)
