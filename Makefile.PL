use strict;
use warnings;

use inc::Module::Install;

name     'GIS-Distance-Fast';
perl_version '5.008003';
all_from 'lib/GIS/Distance/Fast.pm';

requires 'GIS::Distance' => 0.02;
requires 'Inline'        => 0.44;

build_requires 'Test::More' => 0.62;

recommends 'Test::Pod' => 1.22;

WriteAll;

