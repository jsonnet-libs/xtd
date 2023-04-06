local d = import 'doc-util/main.libsonnet';

{
  '#': d.pkg(
    name='date',
    url='github.com/jsonnet-libs/xtd/date.libsonnet',
    help='`time` provides various date related functions.',
  ),

  local commonYearMonthLength = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
  local commonYearMonthOffset = [0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5],
  local leapYearMonthOffset = [0, 3, 4, 0, 2, 5, 0, 3, 6, 1, 4, 6],
  local monthOffset(year, month) = if self.isLeapYear(year) then leapYearMonthOffset[month - 1]
  else commonYearMonthOffset[month - 1],
  '#isLeap': d.fn(
    '`isLeap` returns true if the given year is a leap year.',
    [d.arg('year', d.T.number)],
  ),
  isLeapYear(year):: year % 4 == 0 && (year % 100 != 0 || year % 400 == 0),

  '#dayOfWeek': d.fn(
    '`dayOfWeek` returns the day of the week for the given date. 0=Sunday, 1=Monday, etc.',
    [d.arg('year', d.T.number), d.arg('month', d.T.number), d.arg('day', d.T.number)],
  ),
  dayOfWeek(year, month, day)::
    (day + monthOffset(year, month) + 5 * ((year - 1) % 4) + 4 * ((year - 1) % 100) + 6 * ((year - 1) % 400)) % 7,

  '#dayofYear': d.fn(
    '`dayOfYear` returns the ordinal day of the year for the given date (1-365 for common years, 1-366 for leap years).',
    [d.arg('year', d.T.number), d.arg('month', d.T.number), d.arg('day', d.T.number)],
  ),
  dayOfYear(year, month, day)::
    std.foldl(function(a, b) a + b, std.slice(commonYearMonthLength, 0, month - 1, 1), 0) + day +
    if month > 2 && self.isLeapYear(year) then 1 else 0,
}
