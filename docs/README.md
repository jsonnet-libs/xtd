# xtd

`xtd` aims to collect useful functions not included in the Jsonnet standard library (`std`).

This package serves as a test field for functions intended to be contributed to `std`
in the future, but also provides a place for less general, yet useful utilities.


## Install

```
jb install github.com/jsonnet-libs/xtd/main.libsonnet@master
```

## Usage

```jsonnet
local xtd = import "github.com/jsonnet-libs/xtd/main.libsonnet"
```

## Subpackages

* [aggregate](xtd/aggregate.md)
* [ascii](xtd/ascii.md)
* [camelcase](xtd/camelcase.md)
* [date](xtd/date.md)
* [inspect](xtd/inspect.md)
* [url](xtd/url.md)

