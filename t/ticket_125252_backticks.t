use strict;

# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ticket_125252_backticks.t'

# Adapted from: https://rt.cpan.org/Public/Bug/Display.html?id=125252

#########################

use Test::More tests => 1;

use DBIx::MyParsePP;

my $output = bless( [
                 'query',
                 bless( [
                          'set',
                          bless( [
                                   'SET',
                                   'SET'
                                 ], 'DBIx::MyParsePP::Token' ),
                          bless( [
                                   'option_value',
                                   bless( [
                                            '@',
                                            'V'
                                          ], 'DBIx::MyParsePP::Token' ),
                                   bless( [
                                            'LEX_HOSTNAME',
                                            'VARIABLE'
                                          ], 'DBIx::MyParsePP::Token' ),
                                   bless( [
                                            'EQ',
                                            '='
                                          ], 'DBIx::MyParsePP::Token' ),
                                   bless( [
                                            'IDENT_QUOTED',
                                            'has`backtick'
                                          ], 'DBIx::MyParsePP::Token' )
                                 ], 'DBIx::MyParsePP::Rule' )
                        ], 'DBIx::MyParsePP::Rule' ),
                 bless( [
                          'END_OF_INPUT',
                          ''
                        ], 'DBIx::MyParsePP::Token' )
               ], 'DBIx::MyParsePP::Rule' );

my $myparse = DBIx::MyParsePP->new();
my $sql = 'SET @VARIABLE=`has``backtick`';

my $query = $myparse->parse($sql);

ok( $query->root()->shrink()->isEqual( $output ) == 1 );
