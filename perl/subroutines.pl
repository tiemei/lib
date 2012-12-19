#!/usr/bin/perl

# 即 function

# sub最好统一放在一个文件开头或结尾
sub mysubroutine
{
  # do 
}
&mysubroutine;          # ok
&mysubroutine($_);      # ok
&mysubroutine(1+2, $_); # ok

# parameters
sub mysubroutine
{
  print "@_\n"  # 所有输入参数组成的list array
  print $_[0]; # 第一个参数，但其实这里$_跟之前说道的$_半毛钱关系没有,可以一起用的
}

# return
sub maxnum
{
  if ($_[0] > $_[1])
  {
    $_[0]; # return the last thing evaluated
  }
  else
  {
    $_[1]; # return the last thing evaluated
  }
}

# local var
# @_ $_[0] $_[1] 是的，也可显示申明
sub inside
{
  local($a, $b);
  ($a, $b) = ($_[0], $_[1]); # local($a, $b) = ($_[0], $_[1])
  $a =~ s/ //g; # strip spaces 
  $b =~ s/ //g; 
  ($a =~ /$b/ || $b =~ /$a/);
}
&inside("lemon", "dole money"); # true

