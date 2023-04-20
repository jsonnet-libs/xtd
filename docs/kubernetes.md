---
permalink: /kubernetes/
---

# package kubernetes

```jsonnet
local kubernetes = import "github.com/jsonnet-libs/xtd/kubernetes.libsonnet"
```

`kubernetes` implements helper functions for kubernetes objects

## Index

* [`fn getKubernetesObjects(objects, kind='')`](#fn-getkubernetesobjects)

## Fields

### fn getKubernetesObjects

```ts
getKubernetesObjects(objects, kind='')
```

`getKubernetesObjects` walks a JSON tree returning all Kubernetes
objects in an array, assuming that Kubernetes object are characterized by
having an `apiVersion` and `kind` field.

The `objects` argument can either be an object or an array, other types will be
ignored. The `kind` allows to filter out a specific kind, if unset all kinds will
be returned.
