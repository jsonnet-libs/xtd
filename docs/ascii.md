---
permalink: /ascii/
---

# ascii

```jsonnet
local ascii = import "github.com/jsonnet-libs/xtd/ascii.libsonnet"
```

`ascii` implements helper functions for ascii characters

## Index

* [`fn isLower(c)`](#fn-islower)
* [`fn isNumber(c)`](#fn-isnumber)
* [`fn isStringNumeric(str)`](#fn-isstringnumeric)
* [`fn isUpper(c)`](#fn-isupper)

## Fields

### fn isLower

```ts
isLower(c)
```

`isLower` reports whether ASCII character `c` is a lower case letter

### fn isNumber

```ts
isNumber(c)
```

`isNumber` reports whether character `c` is a number.

### fn isStringNumeric

```ts
isStringNumeric(str)
```

`isStringNumeric` reports whether string `s` consists only of numeric characters.

### fn isUpper

```ts
isUpper(c)
```

`isUpper` reports whether ASCII character `c` is a upper case letter