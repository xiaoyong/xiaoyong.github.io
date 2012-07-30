#!/usr/bin/perl
use strict;

sub fibonacci {
	my $i = shift;
	return $i if $i <= 1;
	return fibonacci($i-1) + fibonacci($i-2) if $i > 1;
}

if (@ARGV < 1) {
	print STDERR "Usage: $0 number\n";
} else {
	my $n = shift @ARGV;
	print "F($n) = ", fibonacci($n), "\n";
}
