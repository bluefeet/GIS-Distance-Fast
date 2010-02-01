package GIS::Distance::Formula::Haversine::Fast;

=head1 NAME

GIS::Distance::Formula::Haversine::Fast - C implementation of GIS::Distance::Formula::Haversine.

=head1 DESCRIPTION

This module is used by L<GIS::Distance> and has the same API as
L<GIS::Distance::Formula::Haversine>.

=head1 AUTHOR

Aran Clary Deltac <bluefeet@cpan.org>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

use Any::Moose;
extends 'GIS::Distance::Formula::Haversine';

use GIS::Distance::Fast;
use Class::Measure::Length qw( length );

sub distance {
    my $self = shift;

    my $c = GIS::Distance::Fast::haversine_distance( @_ );

    return length( $self->kilometer_rho() * $c, 'km' );
}

1;
