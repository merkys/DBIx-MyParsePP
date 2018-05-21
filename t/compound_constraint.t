use strict;

# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl compound_constraint.t'

#########################

use Test::More tests => 1;

use DBIx::MyParsePP;

my $myparse = DBIx::MyParsePP->new();
my $sql = "
CREATE TABLE `experiment_xrd` (
  `rotation`        enum('Yes', 'No') DEFAULT NULL,
  `rotation_period` float DEFAULT NULL,
  CONSTRAINT CHK_Rotation CHECK (
    ( Rotation='Yes' AND rotation_period IS NOT NULL ) OR
    ( Rotation='No' AND rotation_period IS NULL )
  )
);";

my $query = $myparse->parse($sql);
ok(defined $query, 'compound_constraint');
