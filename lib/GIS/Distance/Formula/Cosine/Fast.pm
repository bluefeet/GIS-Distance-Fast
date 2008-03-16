package GIS::Distance::Formula::Cosine::Fast;

=head1 NAME

GIS::Distance::Formula::Cosine::Fast - C implementation of GIS::Distance::Formula::Cosine.

=head1 DESCRIPTION

This module is used by L<GIS::Distance> and has the same API as
L<GIS::Distance::Formula::Cosine>.

=head1 AUTHOR

Aran Clary Deltac <bluefeet@cpan.org>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

use Moose;
extends 'GIS::Distance::Formula::Cosine';

use Class::Measure::Length;
use Inline::Files;
use Inline 'C' => 'BELOW';

sub distance {
    my $self = shift;

    my $c = _distance( @_ );

    return length( $self->kilometer_rho() * $c, 'km' );
}

1;

__C__

#include <math.h>
#define PI 3.14159265358979323846

double _deg2rad(double deg) {
    return ( deg * ( PI / 180.0 ) );
}

double _distance(double lat1, double lon1, double lat2, double lon2) {
    lon1 = _deg2rad( lon1 );
    lat1 = _deg2rad( lat1 );
    lon2 = _deg2rad( lon2 );
    lat2 = _deg2rad( lat2 );

    double a = sin( lat1 ) * sin( lat2 );
    double b = cos( lat1 ) * cos( lat2 ) * cos( lon2 - lon1 );
    double c = acos( a + b );

    return c;
}

