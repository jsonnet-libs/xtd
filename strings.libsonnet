local d = import 'doc-util/main.libsonnet';

{
'#': d.pkg(
    name='strings',
    url='github.com/jsonnet-libs/xtd/strings.libsonnet',
    help=|||
        `strings` implements few helpers functions to manipulate strings.
    |||
    ),

    isUpcase(c)::    std.codepoint(c) >= 65 && std.codepoint(c) <= 90,   // between A & Z
    isDowncase(c)::  std.codepoint(c) >= 97 &&  std.codepoint(c) <= 122, // between a & z
    isDigit(c) ::    std.codepoint(c) >= 48 && std.codepoint(c) <= 57,   // between 0 & 9
    isAlphaNum(c)::  self.isUpcase(c) || self.isDowncase(c) || self.isDigit(c),


    '#camelcase':: d.fn(
        |||
            `camelcase` turns `str` string into its camelcase version.
            By default, first letter will be capitalized, use `lower=true` to keep it down case.
            E.g.
            * `camelcase("A simple string")` → `"ASimpleString"`
            * `camelcase("foo_bar",lower=true)` → `"fooBar"`
            * `camelcase("+++More symbols!!!")` → `"MoreSymbols"` 

            Function alias: `camelcase` 
        |||,
        [
            d.arg('str', d.T.string),
            d.arg('lower', d.T.boolean, default=false),
        ]
    ),
    camelize(w,lower=false): self.camelcase(w, lower),
    camelcase(str,lower=false):
        if std.length(str) == 0
        then ""
        else
            local wcs = std.stringChars(str);
            local camcs = std.filter(function(x) std.length(x) == 1 && self.isAlphaNum(x), [
                if self.isAlphaNum(wcs[i])
                then if i!=0 && self.isAlphaNum(wcs[i-1])
                    then wcs[i]
                    else std.asciiUpper(wcs[i])
                else ""
            
                for i in std.range(0,std.length(wcs)-1)
            ]);
            if std.length(camcs) == 0
            then ""
            else if lower
                then std.join("",[std.asciiLower(camcs[0])] + camcs[1:])
                else std.join("",[std.asciiUpper(camcs[0])] + camcs[1:])
        ,

    '#kebabcase':: d.fn(
        |||
            `kebabcase` turns `str` string into its kebab version.
            By default, all letters are down-cases ; use `caps=true` to have them all capitalized.
            E.g.
            * `kebabcase("A simple string")` → `"a-simple-string"`
            * `kebabcase("FooBar")` → `"foo-bar"`
            * `kebabcase("+++More symbols!!!")` → `"more-symbols"`

            Function aliases: `dasherize`, `kebabcase` 
        |||,
        [
            d.arg('str', d.T.string),
            d.arg('caps', d.T.boolean, default=false ),
        ]
    ),
    dasherize(str,caps=false): self.kebabcase(str,caps),
    kebabize(str,caps=false): self.kebabcase(str,caps),
    kebabcase(str,caps=false): std.join("-",std.filter(function(x) std.length(x)>0,std.split(std.join("",std.flattenArrays([ 
        if self.isDowncase(c) || self.isDigit(c)
        then [c]
        else if self.isUpcase(c) 
            then ['-',if caps then std.asciiUpper(c) else std.asciiLower(c)]
            else ["-"]
    for c in std.stringChars(str)])),"-"))),

    '#traincase':: d.fn(
        |||
            `traincase` turns `str` string into its train case version.
            E.g.
            * `traincase("A simple string")` → `"A-SIMPLE-STRING"`
        |||,
        [
            d.arg('str', d.T.string),
        ]
    ),
    traincase(str): self.kebabcase(str,caps=true), 


    '#snakecase':: d.fn(
        |||
            `snakecase` turns `str` string into its snake version. 
            By default, all letters are down-cases ; use `caps=true` to have them all capitalized.
            E.g.
            * `snakecase("A simple string")` → `"a_simple_string"`
            * `snakecase("FooBar")` → `"foo_bar"`
            * `snakecase("+++More symbols!!!",caps=true)` → `"MORE_SYMBOLS"` 

            Function aliases: `underscore`, `snakecase` 
        |||,
        [
            d.arg('str', d.T.string),
            d.arg('caps', d.T.boolean, default=false ),
        ]
    ),
    underscore(str,caps=false): self.snakecase(str,caps),
    snakize(str,caps=false): self.snakecase(str,caps),
    snakecase(str,caps=false): std.strReplace(self.kebabcase(str,caps), "-", "_"),

    '#screamingsnakecase':: d.fn(
        |||
            `screamingsnakecase` turns `str` string into its screaming snake version.
            E.g.
            * `screamingsnakecase("A simple string")` → `"A_SIMPLE_STRING"`
        |||,
        [
            d.arg('str', d.T.string),
        ]
    ),
    screamingsnakecase(str): self.snakecase(str, caps=true),
    
}