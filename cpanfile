requires 'namespace::clean' => '0.24';
requires 'perl' => '5.008001';
requires 'strictures' => '2.000000';

requires 'Class::Measure::Length';
requires 'GIS::Distance::Formula' => '0.09';
requires 'Moo' => '2.000000';

on test => sub {
    requires 'Test2::V0' => '0.000094';
};
