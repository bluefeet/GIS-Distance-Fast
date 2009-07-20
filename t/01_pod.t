#!/usr/bin/perl -w
use strict;
use warnings;

use Test::More;

plan( skip_all => 'Author test.  Set TEST_AUTHOR env var to a true value to run.' ) if !$ENV{TEST_AUTHOR};

eval( 'use Test::Pod 1.00' );
plan( skip_all => 'Test::Pod required for testing POD' ) if $@;
all_pod_files_ok();

