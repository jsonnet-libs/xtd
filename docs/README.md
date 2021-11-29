---
permalink: /
---

# package xtd

```jsonnet
local xtd = import "github.com/jsonnet-libs/xtd/main.libsonnet"
```

`xtd` aims to collect useful functions not included in the Jsonnet standard library (`std`).

This package serves as a test field for functions intended to be contributed to `std`
in the future, but also provides a place for less general, yet useful utilities.


## Subpackages

* [camelcase](camelcase.md)
* [url](url.md)

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