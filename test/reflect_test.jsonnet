local reflect = import '../reflect.libsonnet';
local test = import 'github.com/jsonnet-libs/testonnet/main.libsonnet';

local obj = {
  a: {},
  b: null,
  c: {
    d: {},
    e: null,
  },
};

test.new(std.thisFile)

+ test.case.new(
  name='prune: vanilla',
  test=test.expect.eq(
    actual=reflect.prune(obj),  // true/false
    expected={},
  )
)
+ test.case.new(
  name='prune: no recurse',
  test=test.expect.eq(
    actual=reflect.prune(obj, recurse=false),  // false/false
    expected={ c: { d: {}, e: null } },
  )
)
+ test.case.new(
  name='prune: only null',
  test=test.expect.eq(
    actual=reflect.prune(obj, only_null=true),  // true/true
    expected={ a: {}, c: { d: {} } },
  )
)
+ test.case.new(
  name='prune: no recurse && only null',
  test=test.expect.eq(
    actual=reflect.prune(obj, recurse=false, only_null=true),  // false/true
    expected={ a: {}, c: { d: {}, e: null } },
  )
)
