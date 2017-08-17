package Stats::Simple;
use 5.008001;
use strict;
use warnings;

use Moo;
use Types::Standard qw(ArrayRef Num);
use List::Util qw();
use POSIX;
use Carp;

use feature 'say'; #this can be removed later

use namespace::clean;

our $VERSION = "0.01";

has 'data' => (is => 'ro', isa => ArrayRef[Num], required => 1);


sub add_data {
    my $self = shift;
    my $other_numbers_ref = shift;
    push @{$self->data}, @{$other_numbers_ref};
}

sub remove_data {
    my $self = shift;
    my $targets_ref = shift;
    my %pruner = map { $_ => 1 } @{$targets_ref};
    @{$self->data} = grep{!$pruner{$_}} @{$self->data};
}

sub count {
    my $self = shift;
    return scalar @{$self->data};
}

sub mean {
    my $self = shift;
    return List::Util::sum(@{$self->data})/(scalar @{$self->data});
}

sub range {
    my $self = shift;
    return (List::Util::max(@{$self->data}) - List::Util::min(@{$self->data}));
}

sub max {
    my $self = shift;
    return List::Util::max @$self->data;
}

sub min {
    my $self = shift;
    return List::Util::min @$self->data;
}

sub sum {
    my $self = shift;
    return List::Util::sum(@$self->data);
}

sub percentiles {
    my $self = shift;
    my @wanted_percentiles = @_;
    my @percentiles;
    my $computed_percentile;
    my @sorted_data = sort { $a <=> $b } @{$self->data};
    foreach (@wanted_percentiles){
        my $computed_percentile = &_compute_percentile($_, \@sorted_data);     
        push @percentiles, $computed_percentile;
    }
    return @percentiles;
}

sub quartiles {
    my $self = shift;
    my @quartiles = $self->percentiles(25, 50, 75);
    return @quartiles;
}

# Add the possibility to compute both population and sample
# standard deviation
sub std_dev {
    my $self = shift;
    my $number_of_elements = $self->count;
    my $mean = $self->mean;
    my $squared_diff = 0;
    my $std_dev;

    foreach (@{$self->data}){
        $squared_diff += ($_ - $mean)**2    
    }
    $std_dev = sqrt($squared_diff / ($number_of_elements - 1));

    return $std_dev;
}

# Add the possibility to compute both population and sample
# variance
sub variance {
    my $self = shift;
    return ($self->std_dev)**2;
}

sub absolute_frequencies {
    my $self = shift;
    my %hist;
    $hist{$_}++ for @{$self->data};
    return \%hist;
}

sub relative_frequencies {
    my $self = shift;
    my %abs_hist = %{$self->absolute_frequencies};
    my %rel_hist;
    my $total = scalar @{$self->data};
    while( my ($key, $value) = each %abs_hist) {
        $rel_hist{$key} = $abs_hist{$key}/$total;
    }
    return \%rel_hist;
}

sub sample_covariance {
    my $self = shift;
    my $other_stat = shift;
    my $covariance;
    my $self_mean = $self->mean;
    my $other_mean = $other_stat->mean;

    croak "Covariance cannot be computed: Number of elements is different" if
        $self->count != $other_stat->count;

    my $total_sum = 0;
    my $no_of_elem = $self->count;

    my @distance_products = map { 
        (${$self->data}[$_] - $self_mean) * (${$other_stat->data}[$_] - $other_mean) 
    } 0..($no_of_elem - 1);

    $total_sum += $_ foreach @distance_products;

    $covariance = $total_sum/($no_of_elem - 1);
    return $covariance;
}

sub correlation {
    my $self = shift;
    my $other_stat = shift;

    croak "Covariance cannot be computed: Number of elements is different" if
        $self->count != $other_stat->count;

    my $covariance = $self->sample_covariance($other_stat);
    my $self_sd = $self->std_dev;
    my $other_sd= $other_stat->std_dev;

    return ($covariance / ($self_sd*$other_sd));
}

sub median {
    my $self = shift;
    my @percentiles = $self->percentiles(50);
    return $percentiles[0];
}

sub mode {
    my $self = shift;
    my $hash = $self->absolute_frequencies;

    my ($key, @keys) = keys   %$hash;
    my ($big, @vals) = values %$hash;

    for (0 .. $#keys) {
        if ($vals[$_] > $big) {
            $big = $vals[$_];
            $key = $keys[$_];
        }
    }
    return ($key, $big);
}

sub _compute_percentile {
    my $wanted_percentile =  shift;
    my $sorted_data_ref = shift;
    my $index = ($wanted_percentile / 100) * (scalar @{$sorted_data_ref});
    my $rounded_index = ceil ($index); 
    return ${$sorted_data_ref}[$rounded_index - 1];
    
}

1;
__END__

=encoding utf-8

=head1 NAME

Statistics::Simple - It's new $module

=head1 SYNOPSIS

    use Statistics::Simple;

=head1 DESCRIPTION

Statistics::Simple is ...

=head1 LICENSE

Copyright (C) gnebbia.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

gnebbia E<lt>nebbia@openmailbox.orgE<gt>

=cut

