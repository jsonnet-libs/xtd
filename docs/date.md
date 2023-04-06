---
permalink: /date/
---

# package date

```jsonnet
local date = import "github.com/jsonnet-libs/xtd/date.libsonnet"
```

`time` provides various date related functions.

## Index

* [`fn dayOfWeek(year, month, day)`](#fn-dayofweek)
* [`fn dayofYear(year, month, day)`](#fn-dayofyear)
* [`fn isLeap(year)`](#fn-isleap)

## Fields

### fn dayOfWeek

```ts
dayOfWeek(year, month, day)
```

`dayOfWeek` returns the day of the week for the given date. 0=Sunday, 1=Monday, etc.

### fn dayofYear

```ts
dayofYear(year, month, day)
```

`dayOfYear` returns the ordinal day of the year for the given date (1-365 for common years, 1-366 for leap years).

### fn isLeap

```ts
isLeap(year)
```

`isLeap` returns true if the given year is a leap year.