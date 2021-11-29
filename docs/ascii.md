---
permalink: /ascii/
---

# package ascii

```jsonnet
local ascii = import "github.com/jsonnet-libs/xtd/ascii.libsonnet"
```

`ascii` implements helper functions for ascii characters

## Index

* [`fn isAsciiLower(c)`](#fn-isasciilower)
* [`fn isAsciiUpper(c)`](#fn-isasciiupper)
* [`fn isNumber(c)`](#fn-isnumber)

## Fields

### fn isAsciiLower

```ts
isAsciiLower(c)
```

`isAsciiLower` reports whether ASCII character `c` is a lower case letter

### fn isAsciiUpper

```ts
isAsciiUpper(c)
```

`isAsciiUpper` reports whether ASCII character `c` is a upper case letter

### fn isNumber

```ts
isNumber(c)
```

`isNumber` reports whether character `c` is a number.