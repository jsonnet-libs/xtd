local d = import 'doc-util/main.libsonnet';

{
  '#': d.pkg(
    name='kubernetes',
    url='github.com/jsonnet-libs/xtd/kubernetes.libsonnet',
    help='`kubernetes` implements helper functions for kubernetes objects',
  ),

  local this = self,

  '#getKubernetesObjects':: d.fn(
    |||
      `getKubernetesObjects` walks a JSON tree returning all Kubernetes
      objects in an array, assuming that Kubernetes object are characterized by
      having an `apiVersion` and `kind` field.

      The `objects` argument can either be an object or an array, other types will be
      ignored. The `kind` allows to filter out a specific kind, if unset all kinds will
      be returned.
    |||,
    args=[
      d.arg('objects', d.T.any),
      d.arg('kind', d.T.string, default=''),
    ]
  ),
  getKubernetesObjects(object, kind=''):
    if std.isObject(object)
    then
      if std.objectHas(object, 'apiVersion')
         && std.objectHas(object, 'kind')
      then
        if kind == '' || object.kind == kind
        then [object]
        else []
      else
        std.foldl(
          function(acc, o)
            acc + this.getKubernetesObjects(object[o], kind),
          std.objectFields(object),
          []
        )
    else if std.isArray(object)
    then
      std.flattenArrays(
        std.map(
          function(obj)
            this.getKubernetesObjects(obj, kind),
          object
        )
      )
    else [],
}
