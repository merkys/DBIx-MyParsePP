use strict;

# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl ticket_83380.t'

# Adapted from: https://rt.cpan.org/Ticket/Display.html?id=83380

#########################

use Test::More tests => 1;

use DBIx::MyParsePP;

my $output = bless( [
                 'query',
                 bless( [
                          'create',
                          bless( [
                                   'CREATE',
                                   'CREATE'
                                 ], 'DBIx::MyParsePP::Token' ),
                          bless( [
                                   'TABLE_SYM',
                                   'TABLE'
                                 ], 'DBIx::MyParsePP::Token' ),
                          bless( [
                                   'IDENT_QUOTED',
                                   'city_hours'
                                 ], 'DBIx::MyParsePP::Token' ),
                          bless( [
                                   'create2',
                                   bless( [
                                            '(',
                                            '('
                                          ], 'DBIx::MyParsePP::Token' ),
                                   bless( [
                                            'create2a',
                                            bless( [
                                                     'field_list',
                                                     bless( [
                                                              'field_spec',
                                                              bless( [
                                                                       'IDENT_QUOTED',
                                                                       'id'
                                                                     ], 'DBIx::MyParsePP::Token' ),
                                                              bless( [
                                                                       'type',
                                                                       bless( [
                                                                                'INT_SYM',
                                                                                'integer'
                                                                              ], 'DBIx::MyParsePP::Token' ),
                                                                       bless( [
                                                                                'opt_len',
                                                                                bless( [
                                                                                         '(',
                                                                                         '('
                                                                                       ], 'DBIx::MyParsePP::Token' ),
                                                                                bless( [
                                                                                         'NUM',
                                                                                         '11'
                                                                                       ], 'DBIx::MyParsePP::Token' ),
                                                                                bless( [
                                                                                         ')',
                                                                                         ')'
                                                                                       ], 'DBIx::MyParsePP::Token' )
                                                                              ], 'DBIx::MyParsePP::Rule' )
                                                                     ], 'DBIx::MyParsePP::Rule' ),
                                                              bless( [
                                                                       'opt_attribute_list',
                                                                       bless( [
                                                                                'attribute',
                                                                                bless( [
                                                                                         'NOT_SYM',
                                                                                         'NOT'
                                                                                       ], 'DBIx::MyParsePP::Token' ),
                                                                                bless( [
                                                                                         'NULL_SYM',
                                                                                         'NULL'
                                                                                       ], 'DBIx::MyParsePP::Token' )
                                                                              ], 'DBIx::MyParsePP::Rule' ),
                                                                       bless( [
                                                                                'attribute',
                                                                                bless( [
                                                                                         'COMMENT_SYM',
                                                                                         'comment'
                                                                                       ], 'DBIx::MyParsePP::Token' ),
                                                                                bless( [
                                                                                         'TEXT_STRING',
                                                                                         'Each row is a datetime range during which Artists and Locations may book Performances for a given City.'
                                                                                       ], 'DBIx::MyParsePP::Token' )
                                                                              ], 'DBIx::MyParsePP::Rule' ),
                                                                       bless( [
                                                                                'AUTO_INC',
                                                                                'auto_increment'
                                                                              ], 'DBIx::MyParsePP::Token' )
                                                                     ], 'DBIx::MyParsePP::Rule' )
                                                            ], 'DBIx::MyParsePP::Rule' ),
                                                     bless( [
                                                              ',',
                                                              ','
                                                            ], 'DBIx::MyParsePP::Token' ),
                                                     bless( [
                                                              'field_spec',
                                                              bless( [
                                                                       'IDENT_QUOTED',
                                                                       'city_id'
                                                                     ], 'DBIx::MyParsePP::Token' ),
                                                              bless( [
                                                                       'type',
                                                                       bless( [
                                                                                'INT_SYM',
                                                                                'integer'
                                                                              ], 'DBIx::MyParsePP::Token' ),
                                                                       bless( [
                                                                                'opt_len',
                                                                                bless( [
                                                                                         '(',
                                                                                         '('
                                                                                       ], 'DBIx::MyParsePP::Token' ),
                                                                                bless( [
                                                                                         'NUM',
                                                                                         '11'
                                                                                       ], 'DBIx::MyParsePP::Token' ),
                                                                                bless( [
                                                                                         ')',
                                                                                         ')'
                                                                                       ], 'DBIx::MyParsePP::Token' )
                                                                              ], 'DBIx::MyParsePP::Rule' )
                                                                     ], 'DBIx::MyParsePP::Rule' ),
                                                              bless( [
                                                                       'attribute',
                                                                       bless( [
                                                                                'NOT_SYM',
                                                                                'NOT'
                                                                              ], 'DBIx::MyParsePP::Token' ),
                                                                       bless( [
                                                                                'NULL_SYM',
                                                                                'NULL'
                                                                              ], 'DBIx::MyParsePP::Token' )
                                                                     ], 'DBIx::MyParsePP::Rule' )
                                                            ], 'DBIx::MyParsePP::Rule' )
                                                   ], 'DBIx::MyParsePP::Rule' ),
                                            bless( [
                                                     ')',
                                                     ')'
                                                   ], 'DBIx::MyParsePP::Token' )
                                          ], 'DBIx::MyParsePP::Rule' )
                                 ], 'DBIx::MyParsePP::Rule' )
                        ], 'DBIx::MyParsePP::Rule' ),
                 bless( [
                          'END_OF_INPUT',
                          ''
                        ], 'DBIx::MyParsePP::Token' )
               ], 'DBIx::MyParsePP::Rule' );

my $myparse = DBIx::MyParsePP->new();
my $sql = "
CREATE TABLE `city_hours` (
    `id` integer(11) NOT NULL comment 'Each row is a datetime range during which Artists and Locations may book Performances for a given City.' auto_increment,
    `city_id` integer(11) NOT NULL
);";

my $query = $myparse->parse($sql);

ok( $query->root()->shrink()->isEqual( $output ) == 1 );
