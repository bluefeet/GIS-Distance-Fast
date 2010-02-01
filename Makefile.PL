use inc::Module::Install;

name     'GIS-Distance-Fast';
perl_version '5.008003';
all_from 'lib/GIS/Distance/Fast.pm';
readme_from 'lib/GIS/Distance/Fast.pm';
githubmeta;

requires 'GIS::Distance' => 0.07;

test_requires 'Test::More' => 0.94;

WriteAll;

