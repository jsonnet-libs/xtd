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

+ test.case.new(
  name='only beginning numeric',
  test=test.expect.eq(
    actual=ascii.isStringNumeric('123abc'),
    expected=false,
  )
)

+ test.case.new(
  name='only end numeric',
  test=test.expect.eq(
    actual=ascii.isStringNumeric('abc123'),
    expected=false,
  )
)

+ test.case.new(
  name='none numeric',
  test=test.expect.eq(
    actual=ascii.isStringNumeric('abc'),
    expected=false,
  )
)

+ test.case.new(
  name='empty',
  test=test.expect.eq(
    actual=ascii.isStringNumeric(''),
    expected=true,
  )
)
