local d = import 'doc-util/main.libsonnet';

{
  '#': d.pkg(
    name='xtd',
    url='github.com/jsonnet-libs/xtd/main.libsonnet',
    help=|||
      `xtd` aims to collect useful functions not included in the Jsonnet standard library (`std`).

      This package serves as a test field for functions intended to be contributed to `std`
      in the future, but also provides a place for less general, yet useful utilities.
    |||,
  ),

  url: {
    '#': d.pkg(
      name='url',
      url='github.com/jsonnet-libs/xtd/url/main.libsonet',
      help='`url` implements URL escaping and query building',
    ),

    '#escapeString': d.fn('`escapeString` escapes the given string so it can be safely placed inside an URL, replacing special characters with `%XX` sequences', [d.arg('string', d.T.string)]),
    escapeString(str)::
      local allowedChars = '0123456789abcdefghijklmnopqrstuvwqxyzABCDEFGHIJKLMNOPQRSTUVWQXYZ';
      local utf8(char) = std.foldl(function(a, b) a + '%%%02X' % b, std.encodeUTF8(char), '');
      local escapeChar(char) = if std.member(allowedChars, char) then char else utf8(char);
      std.join('', std.map(escapeChar, std.stringChars(str))),

    '#encodeQuery': d.fn('`encodeQuery` takes an object of query parameters and returns them as an escaped `key=value` string', [d.arg('params', d.T.object)]),
    encodeQuery(params)::
      local fmtParam(p) = '%s=%s' % [self.escapeString(p), self.escapeString(params[p])];
      std.join('&', std.map(fmtParam, std.objectFields(params))),
  },
}
