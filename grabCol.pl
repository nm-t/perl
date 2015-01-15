#!/usr/bin/perl

# Grabs a column from a file and prints that column to a new file.

use strict;
use warnings;

print "Please supply input in the format of \"<filename> <column number> <delimiter>\". 
If the delimiter is a tab or line break, enter it simply as \\t or \\n.\n";

# Take and process input
my $input = <STDIN>;
my @inFields = split " ", $input;
chomp($inFields[2]);

# Open the file specified by the arguments passed.
open(my $data, '<', $inFields[0]);

# Prepare the file to write to (same file name with .txt on the end)
my $txtFile = substr($inFields[0], 0, -3). "txt";
open(FILE, '>', $txtFile) or die "Couldn't open file to write to, $!";

# Begin writing to file
my $count = 0;
while(my $line = <$data>){
 	my @fields = split $inFields[2], $line;
 	print $fields[$inFields[1] - 1], "\n";
 	print FILE $fields[$inFields[1] - 1], "\n";
 	$count++;
}

print $count. " lines printed to file.\n";
close FILE;
