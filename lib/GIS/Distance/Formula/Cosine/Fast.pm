package GIS::Distance::Formula::Cosine::Fast;
use 5.008001;
use strictures 2;
our $VERSION = '0.08';

=encoding utf8

=head1 NAME

GIS::Distance::Formula::Cosine::Fast - C implementation of GIS::Distance::Formula::Cosine.

=head1 DESCRIPTION

This module is used by L<GIS::Distance> and has the same API as
L<GIS::Distance::Formula::Cosine>.

=cut

use GIS::Distance::Fast;
use Class::Measure::Length qw( length );

use Moo;
use namespace::clean;

with 'GIS::Distance::Formula';

sub distance {
    my $self = shift;

    my $c = GIS::Distance::Fast::cosine_distance( @_ );

    return length( $self->kilometer_rho() * $c, 'km' );
}

1;
__END__

=head1 AUTHORS AND LICENSE

See L<GIS::Distance::Fast/AUTHORS> and L<GIS::Distance::Fast/LICENSE>.

=cut

