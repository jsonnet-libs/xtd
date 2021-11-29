---
permalink: /inspect/
---

# package inspect

```jsonnet
local inspect = import "github.com/jsonnet-libs/xtd/ascii.libsonnet"
```

`inspect` implements helper functions for inspecting Jsonnet

## Index

* [`fn inspect(object, maxDepth, depth)`](#fn-inspect)

## Fields

### fn inspect

```ts
inspect(object, maxDepth, depth)
```

`inspect` reports the structure of a Jsonnet object with a recursion depth of
`maxDepth` (default maxDepth=10).
