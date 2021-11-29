{
  local cp(c) = std.codepoint(c),

  asciiIsLower(c):
    if cp(c) >= 97 && cp(c) < 123
    then true
    else false,

  asciiIsUpper(c):
    if cp(c) >= 65 && cp(c) < 91
    then true
    else false,

  stringIsNumber(c):
    if std.isNumber(c) || (cp(c) >= 48 && cp(c) < 58)
    then true
    else false,
}
