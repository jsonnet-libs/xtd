local d = import 'doc-util/main.libsonnet';

{
  '#': d.pkg(
    name='ascii',
    url='github.com/jsonnet-libs/xtd/ascii.libsonnet',
    help='`ascii` implements helper functions for ascii characters',
  ),

  local cp(c) = std.codepoint(c),

  '#isAsciiLower':: d.fn(
    '`isAsciiLower` reports whether ASCII character `c` is a lower case letter',
    [d.arg('c', d.T.string)]
  ),
  isAsciiLower(c):
    if cp(c) >= 97 && cp(c) < 123
    then true
    else false,

  '#isAsciiUpper':: d.fn(
    '`isAsciiUpper` reports whether ASCII character `c` is a upper case letter',
    [d.arg('c', d.T.string)]
  ),
  isAsciiUpper(c):
    if cp(c) >= 65 && cp(c) < 91
    then true
    else false,

  '#isNumber':: d.fn(
    '`isNumber` reports whether character `c` is a number.',
    [d.arg('c', d.T.string)]
  ),
  isNumber(c):
    if std.isNumber(c) || (cp(c) >= 48 && cp(c) < 58)
    then true
    else false,

}
