#!/usr/bin/perl

%ages = ("Michael Caine",    39,
         "Dirty Den",        34,
         "Angie",            27,
         "Willy",            "21 in dog years",
         "The Queen Mother", 108);

# 因为返回值是一个scalar var，所以前缀$
$ages{"Michael Caine"}; # return 39
$ages{"Willy"};         # return "21 in dog years"

# associative array 和list array互转
@info = %ages;
%moreages = @info; 

# %ages无序，不过keys和values函数返回的值顺序相同，不一定和传入时相同
@keys = keys %ages;
@values = values %ages;

while (($person, $age) = each(%ages))
{
  # do
}


