# NAME

GIS::Distance::Fast - C implementation of GIS::Distance formulas.

# DESCRIPTION

This distribution re-implements some, but not all, of the formulas
that come with [GIS::Distance](https://metacpan.org/pod/GIS::Distance) in the C programming language.  C code
is generally much faster than the perl equivilent.

In most of my testing I've found that the C version of the formulas
outperform the Perl equivelent by at least 2x.

This module need not be used directly.  [GIS::Distance](https://metacpan.org/pod/GIS::Distance) will automatically
use the ::Fast formulas when they are available.

# FORMULAS

[GIS::Distance::Formula::Cosine::Fast](https://metacpan.org/pod/GIS::Distance::Formula::Cosine::Fast)

[GIS::Distance::Formula::Haversine::Fast](https://metacpan.org/pod/GIS::Distance::Formula::Haversine::Fast)

[GIS::Distance::Formula::Vincenty::Fast](https://metacpan.org/pod/GIS::Distance::Formula::Vincenty::Fast)

# BUGS

The [GIS::Distance::Formula::Vincenty::Fast](https://metacpan.org/pod/GIS::Distance::Formula::Vincenty::Fast) produces slightly different results than
[GIS::Distance::Formula::Vincenty](https://metacpan.org/pod/GIS::Distance::Formula::Vincenty).  Read the POD for [GIS::Distance::Formula::Vincenty::Fast](https://metacpan.org/pod/GIS::Distance::Formula::Vincenty::Fast)
for details.

# SUPPORT

Please submit bugs and feature requests to the GIS-Distance-Fast GitHub issue tracker:

[https://github.com/bluefeet/GIS-Distance-Fast/issues](https://github.com/bluefeet/GIS-Distance-Fast/issues)

# AUTHORS

    Aran Clary Deltac <bluefeet@gmail.com>

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
