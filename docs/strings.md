---
permalink: /strings/
---

# strings

```jsonnet
local strings = import "github.com/jsonnet-libs/xtd/strings.libsonnet"
```

`strings` implements few helpers functions to manipulate strings.


## Index

* [`fn camelcase(str, lower=false)`](#fn-camelcase)
* [`fn kebabcase(str, caps=false)`](#fn-kebabcase)
* [`fn screamingsnakecase(str)`](#fn-screamingsnakecase)
* [`fn snakecase(str, caps=false)`](#fn-snakecase)
* [`fn traincase(str)`](#fn-traincase)

## Fields

### fn camelcase

```ts
camelcase(str, lower=false)
```

`camelcase` turns `str` string into its camelcase version.
By default, first letter will be capitalized, use `lower=true` to keep it down case.
E.g.
* `camelcase("A simple string")` → `"ASimpleString"`
* `camelcase("foo_bar",lower=true)` → `"fooBar"`
* `camelcase("+++More symbols!!!")` → `"MoreSymbols"` 

Function alias: `camelcase` 


### fn kebabcase

```ts
kebabcase(str, caps=false)
```

`kebabcase` turns `str` string into its kebab version.
By default, all letters are down-cases ; use `caps=true` to have them all capitalized.
E.g.
* `kebabcase("A simple string")` → `"a-simple-string"`
* `kebabcase("FooBar")` → `"foo-bar"`
* `kebabcase("+++More symbols!!!")` → `"more-symbols"`

Function aliases: `dasherize`, `kebabcase` 


### fn screamingsnakecase

```ts
screamingsnakecase(str)
```

`screamingsnakecase` turns `str` string into its screaming snake version.
E.g.
* `screamingsnakecase("A simple string")` → `"A_SIMPLE_STRING"`


### fn snakecase

```ts
snakecase(str, caps=false)
```

`snakecase` turns `str` string into its snake version.
E.g.
* `snakecase("A simple string")` → `"a_simple_string"`
* `snakecase("FooBar")` → `"foo_bar"`
* `snakecase("+++More symbols!!!",caps=true)` → `"MORE_SYMBOLS"` 

Function aliases: `underscore`, `snakecase` 


### fn traincase

```ts
traincase(str)
```

`traincase` turns `str` string into its train case version.
E.g.
* `traincase("A simple string")` → `"A-SIMPLE-STRING"`
