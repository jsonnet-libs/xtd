local d = import 'github.com/jsonnet-libs/docsonnet/doc-util/main.libsonnet';

{
  '#': d.pkg(
    name='ascii',
    url='github.com/jsonnet-libs/xtd/ascii.libsonnet',
    help='`ascii` implements helper functions for ascii characters',
  ),

  local cp(c) = std.codepoint(c),

  '#isLower':: d.fn(
    '`isLower` reports whether ASCII character `c` is a lower case letter',
    [d.arg('c', d.T.string)]
  ),
  isLower(c): cp(c) >= 97 && cp(c) < 123,

  '#isUpper':: d.fn(
    '`isUpper` reports whether ASCII character `c` is a upper case letter',
    [d.arg('c', d.T.string)]
  ),
  isUpper(c): cp(c) >= 65 && cp(c) < 91,

  '#isNumber':: d.fn(
    '`isNumber` reports whether character `c` is a number.',
    [d.arg('c', d.T.string)]
  ),
  isNumber(c): std.isNumber(c) || (cp(c) >= 48 && cp(c) < 58),

  '#isStringNumeric':: d.fn(
    '`isStringNumeric` reports whether string `s` consists only of numeric characters.',
    [d.arg('str', d.T.string)]
  ),
  isStringNumeric(str): std.all(std.map(self.isNumber, std.stringChars(str))),
}
