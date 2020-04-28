
# package xtd
```jsonnet
local xtd = import "github.com/jsonnet-libs/xtd/main.libsonnet"
```

`xtd` provides useful functions not included in the Jsonnet standard library (`std`).

 We hope for all of these to become part of `std` once proved mature enough.


## Index

* `obj url`
  * `fn encodeQuery(params)`
  * `fn escapeString(string)`


 
## url
`url` implementes URL query escaping and simplifies queries

 
### fn url.encodeQuery
```
url.encodeQuery(params)
```
`encodeQuery` takes an object of query parameters and returns them as an escaped `key=value` string

 
### fn url.escapeString
```
url.escapeString(string)
```
`escapeString` escapes the given string so it can be safely placed inside an URL, replacing special characters with `%XX` sequences



