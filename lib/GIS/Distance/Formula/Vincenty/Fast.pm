package GIS::Distance::Formula::Vincenty::Fast;

=head1 NAME

GIS::Distance::Formula::Vincenty::Fast - C implementation of GIS::Distance::Formula::Vincenty.

=head1 DESCRIPTION

This module is used by L<GIS::Distance> and has the same API as
L<GIS::Distance::Formula::Vincenty>.

=head1 NOTES

The results from Formula::Vincenty versus Formula::Vincenty::Fast are slightly
different.  I'm still not sure why this is, as the C code is nearly identical to
the Perl code.

=head1 AUTHOR

Aran Clary Deltac <bluefeet@cpan.org>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

use Moose;
extends 'GIS::Distance::Formula::Vincenty';

use GIS::Distance::Fast;
use Class::Measure::Length qw( length );

sub distance {
    my $self = shift;

    my $c = GIS::Distance::Fast::vincenty_distance( @_ );

    return length( $c, 'm' );
}

1;
