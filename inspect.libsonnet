local d = import 'doc-util/main.libsonnet';

{
  '#': d.pkg(
    name='inspect',
    url='github.com/jsonnet-libs/xtd/inspect.libsonnet',
    help='`inspect` implements helper functions for inspecting Jsonnet',
  ),


  '#inspect':: d.fn(
    |||
      `inspect` reports the structure of a Jsonnet object with a recursion depth of
      `maxDepth` (default maxDepth=10).
    |||,
    [
      d.arg('object', d.T.object),
      d.arg('maxDepth', d.T.number),
      //d.arg('depth', d.T.number), // used for recursion, not exposing in docs
    ]
  ),

  local this = self,
  inspect(object, maxDepth=10, depth=0):
    std.foldl(
      function(acc, p)
        acc + (
          if std.isObject(object[p])
             && depth != maxDepth
          then { [p]+:
            this.inspect(
              object[p],
              maxDepth,
              depth + 1
            ) }
          else {
            [
            (if !std.objectHas(object, p)
             then 'hidden_'
             else '')
            + (if std.isFunction(object[p])
               then 'functions'
               else 'fields')
            ]+: [p],
          }
        ),
      std.objectFieldsAll(object),
      {}
    ),
}
