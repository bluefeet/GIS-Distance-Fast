requires 'namespace::clean' => '0.24';
requires 'perl' => '5.008001';
requires 'strictures' => '2.000000';

requires 'GIS::Distance' => '0.11';
requires 'GIS::Distance::Constants' => '0.11';

on test => sub {
    requires 'Test2::V0' => '0.000094';
};
