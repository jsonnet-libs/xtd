local d = import 'github.com/jsonnet-libs/docsonnet/doc-util/main.libsonnet';

{
  '#': d.pkg(
    name='reflect',
    url='github.com/jsonnet-libs/xtd/reflect.libsonnet',
    help='`reflect` implements helper functions for processing json data.',
  ),

  '#prune':: d.fn(
    '`prune` works the same as `std.prune` but with the options to disable recursion and only pruning `null` values.',
    [
      d.arg('a', d.T.any),
      d.arg('recurse', d.T.bool, default=false),
      d.arg('only_null', d.T.bool, default=false),
    ]
  ),
  prune(a, recurse=true, only_null=false)::
    local isContent(b) =
      if b == null
      then false
      else if only_null
      then true
      else if std.isArray(b)
      then std.length(b) > 0
      else if std.isObject(b)
      then std.length(b) > 0
      else true;
    local doRecursion(x) =
      if recurse
      then self.prune(x, only_null=only_null)
      else x;
    if std.isArray(a)
    then [
      doRecursion(x)
      for x in a
      if isContent(doRecursion(x))
    ]
    else if std.isObject(a)
    then {
      [x]: doRecursion(a[x])
      for x in std.objectFields(a)
      if isContent(doRecursion(a[x]))
    }
    else
      a,

  a:: $.prune(
    {
      a: {},
      b: null,
      c: {
        d: {},
        e: null,
      },
    },
    recurse=false,
    only_null=true,
  ),
}
