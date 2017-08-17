use strict;
use warnings;

use Capture::Tiny ':all';
use Test::More tests => 18;                      # last test to print


BEGIN {
    use_ok("Stats::Simple") || BAIL_OUT();
}

subtest 'Stats::Simple::new works' => sub {
    ok( defined &Stats::Simple::new, 'Stats::Simple::new is defined' ); 
    
    my @list = (1..10);
    my $stat = Stats::Simple->new(data => \@list);
    isa_ok($stat, "Stats::Simple");
    is_deeply($stat->data, \@list, "the list is correctly assigned");
};

subtest 'Stats::Simple::add_data works' => sub {
    ok( defined &Stats::Simple::add_data, 'Stats::Simple::add_data is defined' ); 
    
    my @list = (1..100);
    my $stat = Stats::Simple->new(data => \@list);
    isa_ok($stat, "Stats::Simple");
    my @another_list = (1..10);
    push @list, @another_list;
    
    $stat->add_data(\@another_list);
    is_deeply ($stat->data, \@list, 'data is correctly added with add_data');
};


subtest 'Stats::Simple::count works' => sub {
    ok( defined &Stats::Simple::count, 'Stats::Simple::count is defined' ); 
    
    my @list = (1..100);
    my $stat = Stats::Simple->new(data => \@list);
    isa_ok($stat, "Stats::Simple");
    
    my $no_of_elems = $stat->count;
    is ($no_of_elems, 100, 'count on elements is correct');

    @list = ();
    my $stat2 = Stats::Simple->new(data => \@list);
    $no_of_elems = $stat2->count;
    is ($no_of_elems, 0, 'count works on empty lists');
};

subtest 'Stats::Simple::remove_data works' => sub {
    ok( defined &Stats::Simple::remove_data, 'Stats::Simple::remove_data is defined' ); 
    
    my @list = (1..5);
    my $stat = Stats::Simple->new(data => \@list);
    
    $stat->remove_data([1]);
    is_deeply ($stat->data, [2, 3, 4, 5], 'data is correctly removed with remove_data');

    my $another_stat = Stats::Simple->new(data => [1, 1, 2, 2, 4, 5, 7, 7, 8, 9]);
    $another_stat->remove_data([1, 2, 7]);
    is_deeply ($another_stat->data, [4, 5, 8, 9], 'multiple data is correctly removed with remove_data');
};

subtest 'Stats::Simple::mean works' => sub {
    ok( defined &Stats::Simple::mean, 'Stats::Simple::mean is defined' ); 
    my @list = (1..10);
    my $stat = Stats::Simple->new(data => \@list);
    is (5.5, $stat->mean, "average computed is correct");
};


subtest 'Stats::Simple::range works' => sub {
    ok( defined &Stats::Simple::range, 'Stats::Simple::range is defined' ); 
    my @list = (0..100);
    my $stat = Stats::Simple->new(data => \@list);
    is (100, $stat->range, "range is correct");
};


subtest 'Stats::Simple::percentiles works' => sub {
    ok( defined &Stats::Simple::percentiles, 'Stats::Simple::percentiles is defined' ); 

    my @list = (15, 20, 35, 40, 50);
    my $stat2 = Stats::Simple->new(data => \@list);
    my @percentiles = $stat2->percentiles(5, 30, 40, 50, 100);
    is_deeply(\@percentiles, [15, 20, 20, 35, 50], "percentiles 1 are correct");


    my @list = (3, 6, 7, 8, 8, 10, 13, 15, 16, 20);
    my $stat = Stats::Simple->new(data => \@list);
    my @percentiles = $stat->percentiles(25, 50, 75, 100);
    is_deeply(\@percentiles, [7, 8, 15, 20], "percentiles 2 are correct");


    my @list = (3, 6, 7, 8, 8, 9, 10, 13, 15, 16, 20);
    my $stat3 = Stats::Simple->new(data => \@list);
    my @percentiles = $stat3->percentiles(25, 50, 75, 100);
    is_deeply(\@percentiles, [7, 9, 15, 20], "percentiles 3 are correct");
};



subtest 'Stats::Simple::std_dev works' => sub {
    ok( defined &Stats::Simple::std_dev, 'Stats::Simple::std_dev is defined' ); 

    my @list = (10, 2, 38, 23, 38, 23, 21);
    my $stat = Stats::Simple->new(data => \@list);
    my $std_dev = $stat->std_dev;
    ok($std_dev > 13.27 && $std_dev < 13.29, "standard deviation is correct");
};


subtest 'Stats::Simple::variance works' => sub {
    ok( defined &Stats::Simple::variance, 'Stats::Simple::variance is defined' ); 

    my @list = (10, 2, 38, 23, 38, 23, 21);
    my $stat = Stats::Simple->new(data => \@list);
    my $variance = $stat->variance;

    is ($variance, ($stat->std_dev)**2, "variance computation is correct");
#   ok($variance > 13.27 && $variance < 13.29, "standard deviation is correct");
};

subtest 'Stats::Simple::quartiles works' => sub {
    ok( defined &Stats::Simple::variance, 'Stats::Simple::variance is defined' ); 

    my @list = (3, 6, 7, 8, 8, 9, 10, 13, 15, 16, 20);
    my $stat = Stats::Simple->new(data => \@list);
    my @quartiles = $stat->quartiles;

    is_deeply(\@quartiles, [7, 9, 15], "quartiles are correct");
};


subtest 'Stats::Simple::absolute_frequencies works' => sub {
    ok( defined &Stats::Simple::absolute_frequencies, 'Stats::Simple::absolute_frequencies is defined' ); 

    my @list = (1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 10, 15, 15, 25);
    my %test_hash = (
        1   => 5,
        2   => 2,
        3   => 4,
        10  => 1,
        15  => 2,
        25  => 1
    );
    my $stat = Stats::Simple->new(data => \@list);
    my %abs_freqs = %{$stat->absolute_frequencies};
    is_deeply(\%test_hash, \%abs_freqs, "Absolute frequencies are correct");
};

subtest 'Stats::Simple::relative_frequencies works' => sub {
    ok( defined &Stats::Simple::relative_frequencies, 'Stats::Simple::relative_frequencies is defined' ); 

    my @list = (1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 10, 15, 15, 25);
    
    my %test_hash = (
        1   => 5/15,
        2   => 2/15,
        3   => 4/15,
        10  => 1/15,
        15  => 2/15,
        25  => 1/15,
    );
    my $stat = Stats::Simple->new(data => \@list);
    my %rel_freqs = %{$stat->relative_frequencies};
    is_deeply(\%test_hash, \%rel_freqs, "Relative frequencies are correct");
};


subtest 'Stats::Simple::sample_covariance' => sub {
    ok( defined &Stats::Simple::sample_covariance, 'Stats::Simple::correlation is defined' ); 

    my @list = (1..10);
    
    my $stat = Stats::Simple->new(data => \@list);
    my $stat2 = Stats::Simple->new(data => \@list);
    my $cov = $stat->sample_covariance($stat2);

    ok ($cov > 9.166 && $cov < 9.168, "sample covariance computation is correct");

};

# CHECK CORRELATION
subtest 'Stats::Simple::correlation works' => sub {
    ok( defined &Stats::Simple::correlation, 'Stats::Simple::correlation is defined' ); 

    my @list = (1..10);
    
    my $stat = Stats::Simple->new(data => \@list);
    my $stat2 = Stats::Simple->new(data => \@list);

    my $corr = $stat->correlation($stat2);

    ok($corr > 0.99 && $corr < 1.1, "Correlation with same data returns 1");

    my @list = (1..10);
    my @list2 = (2..10, 166);

    
    my $stat = Stats::Simple->new(data => \@list);
    my $stat2 = Stats::Simple->new(data => \@list2);

    my $corr = $stat->correlation($stat2);

    ok($corr < 0.567 && $corr > 0.564, "Correlation computation is correct");
};


subtest 'Stats::Simple::correlation works' => sub {
    ok( defined &Stats::Simple::median, 'Stats::Simple::median is defined' ); 

    my @list = (1..10);
    
    my $stat = Stats::Simple->new(data => \@list);
    my $median = $stat->median;

    my @quartiles = $stat->quartiles;
    is ($median, $quartiles[1], "Median is equal to the second quartile");
};

subtest 'Stats::Simple::mode works' => sub {
    ok( defined &Stats::Simple::mode, 'Stats::Simple::mode is defined' ); 

    my @list = (1..10, 2..5, 2, 2, 2);
    
    my $stat = Stats::Simple->new(data => \@list);
    my ($mode, $freq) = $stat->mode;

    is($mode, 2, "The mode is correctly computed");
    is($freq, 5, "The frequency associated to the mode is correctly retrieved");
};

TODO: {
    local $TODO = "Top 5 function not done";

    ok( defined &Stats::Simple::mode_top_5, 'Stats::Simple::mode_top_5 is defined' ); 

    my @list = (1..10, 2..5, 2, 2, 2);
    
    my $stat = Stats::Simple->new(data => \@list);
    #my ($mode, $freq) = $stat->mode_top_5;
};

done_testing();

# Other kind of tests memento
#SKIP: {
#    skip "This module is not available", 1 unless ( eval { require Mac::Speec; } );
#    is ('helo', 'helo', "ookaaay");
#    is ('bye', 'bay', "ololmawdaw");
#    is ('bye', 'bay', "ololmawdaw");
#    ok (0 , 'bay');
#}
#
#ok ('hello' eq 'hello', "Now We can greet");
#ok ('hello' eq 'hello', "Now We can greet");
#is (lc 'hello', lc 'Hello', 'hello is hello');
#isnt( "hello", 'Broken', 'The hull is intact' );
#like( 'Mary Ann', qr/Mary[ −]Anne?/, 'Mary Ann is a passenger' );
#unlike( 'Ginger', qr/Mary[ −]Anne?/, 'Mary Ann is a passenger' );
#
#my @list1 = (1..10);
#my @list2 = (1..10);
#is_deeply(\@list1,\@list2, 'dsc are equal');
#
#ok (-5, 'We can printtt');


