#!/usr/local/bin/perl

$sentence = "The quick brown fox";
$sentence =~ /the/ # false, case sensitive
$sentence !~ /the/ # true

# $_
if ($sentence =~ /under/)
{
  # do
}

$_ = $sentence
if (/under/) 
{
  # do
}

# More on REs

. # Any single character except a newline
^ # The beginning of the line or string
$ # The end of the line or string
* # Zero or more of the last character
+ # One or more of the last character
? # Zero or one of the last character

[qjk]     # Either q or j or k
[^qjk]    # Neither q nor j nor k
[a-z]     # Anything from a to z inclusive
[^a-z]    # No lower case letters
[a-zA-Z]  # Any letter
[a-z]+    # Any non-zero sequence of lower case letters

jelly|cream # Either jelly or cream
(eg|le)gs # Either eggs or legs
(da)+   # Either da or dada or dadada or...

\n    # A newline
\t    # A tab
\w    # Any alphanumeric (word) character.
      # The same as [a-zA-Z0-9_]
\W    # Any non-word character.
      # The same as [^a-zA-Z0-9_]
\d    # Any digit. The same as [0-9]
\D    # Any non-digit. The same as [^0-9]
\s    # Any whitespace character: space,
      # tab, newline, etc
\S    # Any non-whitespace character
\b    # A word boundary, outside [] only
\B    # No word boundary


\|    # Vertical bar
\[    # An open square bracket
\)    # A closing parenthesis
\*    # An asterisk
\^    # A carat symbol
\/    # A slash
\\    # A backslash


