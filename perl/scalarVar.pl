#!/usr/local/bin/perl

# operators ---------------------------------
# scalar var hold both strings and numbers,并且可以简单互换
$a = 1 + 2 # + - * /
++$a # 前后 ++ -- 

$a = $b . $c # 连接
$a = $b x $c # $b reapeated $c times

$a += $b # -= .=(append $b onto $a),赋值时是copy一份

# numerical : <  >  <= >= == != <=> + *
# string    : lt gt le ge eq ne cmp . x

# undef -----------------------------------
my $undef = undef;
print $undef; # raise a waning; prints the empty string ""
# implicit undef
my $undef2;
print $undef2; # same

# num and boolean ------------------------
my $num = 40.5 # Perl does not distinguish between an integer and a float
# no boolean data type, 仅下面的在if中为false
undef 0 "" "0"

# weak typing ----------------------------
my $str1 = "4G";
my $str2 = "4H";
print $str1 +  $str2; # "8" with tow warnings
print $str1 eq $str2; # ""(false)
print $str1 == $str2; # "1" with two warnings
print "yes" == "no"   # "1" with two warnings: both values evaluate to 0 when used as numbers





