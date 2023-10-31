local d = import 'doc-util/main.libsonnet';

{
  '#': d.pkg(
    name='date',
    url='github.com/jsonnet-libs/xtd/date.libsonnet',
    help='`time` provides various date related functions.',
  ),

  // Lookup tables for calendar calculations
  local commonYearMonthLength = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
  local commonYearMonthOffset = [0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5],
  local leapYearMonthOffset = [0, 3, 4, 0, 2, 5, 0, 3, 6, 1, 4, 6],

  // monthOffset looks up the offset to apply in day of week calculations based on the year and month
  local monthOffset(year, month) =
    if self.isLeapYear(year)
    then leapYearMonthOffset[month - 1]
    else commonYearMonthOffset[month - 1],

  '#isLeapYear': d.fn(
    '`isLeapYear` returns true if the given year is a leap year.',
    [d.arg('year', d.T.number)],
  ),
  isLeapYear(year):: year % 4 == 0 && (year % 100 != 0 || year % 400 == 0),

  '#dayOfWeek': d.fn(
    '`dayOfWeek` returns the day of the week for the given date. 0=Sunday, 1=Monday, etc.',
    [
      d.arg('year', d.T.number),
      d.arg('month', d.T.number),
      d.arg('day', d.T.number),
    ],
  ),
  dayOfWeek(year, month, day)::
    (day + monthOffset(year, month) + 5 * ((year - 1) % 4) + 4 * ((year - 1) % 100) + 6 * ((year - 1) % 400)) % 7,

  '#dayOfYear': d.fn(
    |||
      `dayOfYear` calculates the ordinal day of the year based on the given date. The range of outputs is 1-365
      for common years, and 1-366 for leap years.
    |||,
    [
      d.arg('year', d.T.number),
      d.arg('month', d.T.number),
      d.arg('day', d.T.number),
    ],
  ),
  dayOfYear(year, month, day)::
    std.foldl(
      function(a, b) a + b,
      std.slice(commonYearMonthLength, 0, month - 1, 1),
      0
    ) + day +
    if month > 2 && self.isLeapYear(year)
    then 1
    else 0,

  // yearSeconds returns the number of seconds in the given year.
  local yearSeconds(year) = (
    if $.isLeapYear(year)
    then 366 * 24 * 3600
    else 365 * 24 * 3600
  ),

  // monthSeconds returns the number of seconds in the given month of a given year.
  local monthSeconds(year, month) = (
    commonYearMonthLength[month - 1] * 24 * 3600
    + if month == 2 && $.isLeapYear(year) then 86400 else 0
  ),

  // sumYearsSeconds returns the number of seconds in all years since 1970 up to year-1.
  local sumYearsSeconds(year) = std.foldl(
    function(acc, y) acc + yearSeconds(y),
    std.range(1970, year - 1),
    0,
  ),

  // sumMonthsSeconds returns the number of seconds in all months up to month-1 of the given year.
  local sumMonthsSeconds(year, month) = std.foldl(
    function(acc, m) acc + monthSeconds(year, m),
    std.range(1, month - 1),
    0,
  ),

  // sumDaysSeconds returns the number of seconds in all days up to day-1.
  local sumDaysSeconds(day) = (day - 1) * 24 * 3600,

  '#toUnixTimestamp': d.fn(
    |||
      `toUnixTimestamp` calculates the unix timestamp of a given date.
    |||,
    [
      d.arg('year', d.T.number),
      d.arg('month', d.T.number),
      d.arg('day', d.T.number),
      d.arg('hour', d.T.number),
      d.arg('minute', d.T.number),
      d.arg('second', d.T.number),
    ],
  ),
  toUnixTimestamp(year, month, day, hour, minute, second)::
    sumYearsSeconds(year) + sumMonthsSeconds(year, month) + sumDaysSeconds(day) + hour * 3600 + minute * 60 + second,


}
