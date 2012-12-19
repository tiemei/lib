#!/usr/local/bin/perl

use strict;
use warnings; # 为了避免perl一些扑朔迷离的语法，你可以再开头放上这两句，在编译期间就会检查

print 'hello perl!' # print a message

# perl -w perlfile 在执行之前给出些预先建议，warning
# perl -d perlfile perl的执行过程是先编译，然后执行编译后的版本，这也就能解释为什么你会运行时会得到些编译错误

print $a.' and '.$b
print "$a and $b" # dobule quotes force interplation of any codes


