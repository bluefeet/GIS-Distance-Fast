package GIS::Distance::Formula::Haversine::Fast;

use Moose;
extends 'GIS::Distance::Formula::Haversine';

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

    double dlon = lon2 - lon1;
    double dlat = lat2 - lat1;
    double a = pow( sin(dlat/2), 2 ) + cos(lat1) * cos(lat2) * pow( sin(dlon/2), 2 );
    double c = 2 * atan2( sqrt(a), sqrt(1-a) );

    return c;
}

