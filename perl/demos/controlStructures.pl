#!/usr/local/bin/perl

$a == $b    # Is $a numerically equal to $b?
$a != $b   
$a eq $b    # Is $a string-equal to $b?
$a ne $b

($a && $b)
($a || $b)
!($a)

# foreach
foreach $e (@food)
{
  print "$e\n"; # item
}

# for
for ($i = 0; $i < 10; ++$i)
{
  print "$i\n";
}

# while and util
$a = <STDIN>; # get input
chop $a;      # remove the newline at end
while ($a ne "fred")
{
  # do something
}

do
{
  # do something
}
while ($a ne "fred")

while ($line = <INFO>) # 按行处理文件
{
  # do something
}

# if
if ($a) # '0' false
{
  # do 
}
elsif (length($a) == 1)
{
  # do
}
else
{
  # do
} 
