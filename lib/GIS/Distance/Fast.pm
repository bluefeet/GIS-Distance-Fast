package GIS::Distance::Fast;

=head1 NAME

GIS::Distance::Fast - C implementation of GIS::Distance formulas.

=head1 DESCRIPTION

This distribution re-implements some, but not all, of the formulas
that come with L<GIS::Distance> in the C programming language.  C code
is generally much faster than the perl equivilent.

In most of my testing I've found that the C version of the formulas
outperform the Perl equivelent by at least 2x.

This module need not be used directly.  L<GIS::Distance> will automatically
use the ::Fast formulas when they are available.

=head1 INLINE

Rather than using the complex XS or alternatives, I've opted to
use L<Inline::C> since it is so much simpler to bind the C code
to Perl.  Due to this you should make a directory called '.Inline'
in your home directory.  Otherwise you will end up with _Inline
directories all over the place.

=cut

use strict;
use warnings;

our $VERSION = '0.02';

1;
__END__

=head1 FORMULAS

L<GIS::Distance::Formula::Cosine::Fast>

L<GIS::Distance::Formula::Haversine::Fast>

L<GIS::Distance::Formula::Vincenty::Fast>

=head1 BUGS

The L<GIS::Distance::Formula::Vincenty::Fast> produces slightly different results than
L<GIS::Distance::Formula::Vincenty>.  Read the POD for L<GIS::Distance::Formula::Vincenty::Fast>
for details.

=head1 TEST COVERAGE

  ---------------------------- ------ ------ ------ ------ ------ ------ ------
  File                           stmt   bran   cond    sub    pod   time  total
  ---------------------------- ------ ------ ------ ------ ------ ------ ------
  ...ce/Formula/Cosine/Fast.pm  100.0    n/a    n/a  100.0  100.0   37.4  100.0
  ...Formula/Haversine/Fast.pm  100.0    n/a    n/a  100.0  100.0   25.6  100.0
  .../Formula/Vincenty/Fast.pm  100.0    n/a    n/a  100.0  100.0   37.0  100.0
  Total                         100.0    n/a    n/a  100.0  100.0  100.0  100.0
  ---------------------------- ------ ------ ------ ------ ------ ------ ------

=head1 AUTHOR

Aran Clary Deltac <bluefeet@cpan.org>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

