#!/usr/bin/perl

# 按正则，分解字符串到array
$info = "Caine:Michael:Actor";
@personal = split(/:/, $info);
print "@personal" # Caine Michael Actor

# $_可用
$_ = $info
@personal = split(/:/)

@chars = split(//, $word);
@words = split(/ /, $sentence);
@sentences = split(/\./, $paragraph);

substr("Once upon a time", 3, 4); # returns "e up"
substr("Once upon a time", 7);    # returns "on a time"
substr("Once upon a time", -6, 5);  # returns "a tim"

