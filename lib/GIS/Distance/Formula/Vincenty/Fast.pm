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

use Class::Measure::Length;
use Inline::Files;
use Inline 'C' => 'BELOW';

sub distance {
    my $self = shift;

    my $c = _distance( @_ );

    return length( $c, 'm' );
}

1;

__C__

#include <math.h>
#define PI 3.14159265358979323846

double _deg2rad(double deg) {
    return ( deg * ( PI / 180.0 ) );
}

double _distance(double lat1, double lon1, double lat2, double lon2) {
    if ( (lon1==lon2) && (lat1==lat2) ) {
        return 0;
    }
    lon1 = _deg2rad( lon1 );
    lat1 = _deg2rad( lat1 );
    lon2 = _deg2rad( lon2 );
    lat2 = _deg2rad( lat2 );

    double a = 6378137;
    double b = 6356752.3142;
    double f = 1/298.257223563;

    double l = lon2 - lon1;

    double u1 = atan( (1-f) * tan(lat1) );
    double u2 = atan( (1-f) * tan(lat2) );

    double sin_u1 = sin(u1);
    double cos_u1 = cos(u1);
    double sin_u2 = sin(u2);
    double cos_u2 = cos(u2);

    double lambda     = l;
    double lambda_pi  = 2 * PI;
    int iter_limit = 20;

    double cos_sq_alpha = 0;
    double sin_sigma    = 0;
    double cos2sigma_m  = 0;
    double cos_sigma    = 0;
    double sigma        = 0;

    while( abs(lambda-lambda_pi) > 1e-12 && --iter_limit>0 ){
        double sin_lambda = sin(lambda);
        double cos_lambda = cos(lambda);

        sin_sigma = sqrt((cos_u2*sin_lambda) * (cos_u2*sin_lambda) +
            (cos_u1*sin_u2-sin_u1*cos_u2*cos_lambda) * (cos_u1*sin_u2-sin_u1*cos_u2*cos_lambda));

        cos_sigma = sin_u1*sin_u2 + cos_u1*cos_u2*cos_lambda;
        sigma = atan2(sin_sigma, cos_sigma);

        double alpha = asin(cos_u1 * cos_u2 * sin_lambda / sin_sigma);
        cos_sq_alpha = cos(alpha) * cos(alpha);
        cos2sigma_m = cos_sigma - 2*sin_u1*sin_u2/cos_sq_alpha;

        double cc = f/16*cos_sq_alpha*(4+f*(4-3*cos_sq_alpha));
        lambda_pi = lambda;
        lambda = l + (1-cc) * f * sin(alpha) *
            (sigma + cc*sin_sigma*(cos2sigma_m+cc*cos_sigma*(-1+2*cos2sigma_m*cos2sigma_m)));
    }

    double usq = cos_sq_alpha*(a*a-b*b)/(b*b);
    double aa = 1 + usq/16384*(4096+usq*(-768+usq*(320-175*usq)));
    double bb = usq/1024 * (256+usq*(-128+usq*(74-47*usq)));
    double delta_sigma = bb*sin_sigma*(cos2sigma_m+bb/4*(cos_sigma*(-1+2*cos2sigma_m*cos2sigma_m)-
        bb/6*cos2sigma_m*(-3+4*sin_sigma*sin_sigma)*(-3+4*cos2sigma_m*cos2sigma_m)));
    double c = b*aa*(sigma-delta_sigma);

    return c;
}

