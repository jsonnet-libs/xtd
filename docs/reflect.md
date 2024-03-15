---
permalink: /reflect/
---

# reflect

```jsonnet
local reflect = import "github.com/jsonnet-libs/xtd/reflect.libsonnet"
```

`reflect` implements helper functions for processing json data.

## Index

* [`fn prune(a, recurse=false, only_null=false)`](#fn-prune)

## Fields

### fn prune

```ts
prune(a, recurse=false, only_null=false)
```

`prune` works the same as `std.prune` but with the options to disable recursion and only pruning `null` values.