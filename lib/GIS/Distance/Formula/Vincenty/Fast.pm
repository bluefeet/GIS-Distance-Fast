package GIS::Distance::Formula::Vincenty::Fast;
use 5.008001;
use strictures 2;
our $VERSION = '0.08';

=encoding utf8

=head1 NAME

GIS::Distance::Formula::Vincenty::Fast - C implementation of GIS::Distance::Formula::Vincenty.

=head1 DESCRIPTION

This module is used by L<GIS::Distance> and has the same API as
L<GIS::Distance::Formula::Vincenty>.

=head1 NOTES

The results from Formula::Vincenty versus Formula::Vincenty::Fast are slightly
different.  I'm still not sure why this is, as the C code is nearly identical to
the Perl code.

=cut

use GIS::Distance::Fast;
use Class::Measure::Length qw( length );

use Moo;
use namespace::clean;

with 'GIS::Distance::Formula';

sub distance {
    my $self = shift;

    my $c = GIS::Distance::Fast::vincenty_distance( @_ );

    return length( $c, 'm' );
}

1;
__END__

=head1 AUTHORS AND LICENSE

See L<GIS::Distance::Fast/AUTHORS> and L<GIS::Distance::Fast/LICENSE>.

=cut

