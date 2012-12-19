#!/usr/local/bin/perl

$file = '/etc/passwd'; 
open(INFO, $file); # INFO is the filehandle which allows Perl to refer to the file in future.如果放在括号中，类似'~/file'中~不会被解释，除非你这么用<~/file>  
@lines = <INFO>;   # 一次性 read it into an array 
$line  = <INFO>;   # next one line ，两种方式都包含换行符
close(INFO);       # close 
print @lines;      # Print

# open 
open(INFO, $file);    # Open for input
open(INFO, ">$file"); # Open for output
open(INFO, ">>$file");# Open for appending
open(INFO, "<$file"); # Also open for input
open(INFO, '-');      # Open standard input
open(INFO, '>-');     # Open standard output

print INFO "This line goes to the file.\n";



