#!/usr/local/bin/perl
# http://www.comp.leeds.ac.uk/Perl/arrays.html

@food = ("apple", "pears","eels");
@food = (
  "apple",
  "pears",
  "eels", # trailing comma is okay
);

$food[2] # 从0开始,$开头，因为eels是一个scalar
$food[-1] # "eels"支持倒序取出

@morefood = ("lard", @food, "eggs"); # 等价于 @morefood = ("lard", "apple", "pears", "eels", "eggs");

# push : return the length of new list
push(@food, "eggs", "lard");
push(@food, ("eggs", "lard"));
push(@food, @morefood);
# remove 
$lastItem = pop(@food); # eels
$f = @food; # length of @food
$#food      # index of last element of a list
$f = "@food"; # turns the list into a string with a space between each element. This space can be replaced by any other string by changing the value of the special $" variable. This variable is just one of Perl's many special variables, most of which have odd names.

($a, $b) = ($c, $d) # Same as $a=$c; $b=$d;
($a, $b) = @fodd    # first two items of @food
($a, @somefood) = @food # $a is the first item of @food, @somefood left
(@somefood, $a) = @food # @somefood is @food and $a is undefined

print @food;
print "@food";
print @food.'';


