#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Stats::Simple' ) || print "Bail out!\n";
}

diag( "Testing Stats::Simple $Stats::Simple::VERSION, Perl $], $^X" );
