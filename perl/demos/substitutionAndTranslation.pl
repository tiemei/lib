#!/usr/local/bin/perl

# substitution 
$sentence =~ s/london/London/ # 替换第一个，返回做了几次替换,0/1
s/lodon/Lodon/ # $_
s/london/London/gi # 所有替换,且忽略大小写

# remembering patterns
# $1,...,$9, 在同一个RE中用\1..\9

$_ = "Lord whopper of Fibbing";
s/([A-Z])/:\1:/g;

if (/(\b.+\b) \1/)
{
  print "Found $1 repeated\n";
}

/pp/;
$` eq "Lord Who" # true
$& eq "pp" #true
$' eq "er of Fibbing" #true

$search = "the";
s/$search/xxx/g # $会被解释成the
s/${search}re/xxx/g # 如果希望替换there

# translation
$sentence =~ tr/abc/edf/ # 逐个字符替换
$count = ($sentence =~ tr/*/*/); # 计算星号数量
tr /a-z/A-Z/; # dash still mean between


