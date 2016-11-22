#!/usr/bin/perl
use strict;
use warnings;

# These must be loaded before Test::More!
use utf8;
use open qw[ :std :utf8 ];

use Test::More;

BEGIN { use_ok('Text::Hyphen') };

my @data = (
    # Portuguese was chosen because it is the smallest data set with both
    # patterns and exceptions at *the* source for these files:
    # http://mirror.ctan.org/language/hyph-utf8/tex/generic/hyph-utf8/patterns/txt/
    [   'Portuguese',
        [   load_patterns   => 't/data/hyph-pt.pat.txt',
            load_exceptions => 't/data/hyph-pt.hyp.txt'],
        {   
            'Todos'        => 'To-dos',
            'consciência' => 'cons-ci-ên-cia',
            'devem'        => 'de-vem',
            'dignidade'    => 'dig-ni-da-de',
            'direitos'     => 'di-rei-tos',
            'dotados'      => 'do-ta-dos',
            'espírito'    => 'es-pí-ri-to',
            'fraternidade' => 'fra-ter-ni-da-de',
            'hardware'     => 'hard-ware',
            'humanos'      => 'hu-ma-nos',
            'iguais'       => 'iguais',
            'livres'       => 'li-vres',
            'nascem'       => 'nas-cem',
            'outros'       => 'ou-tros',
            'razão'       => 'ra-zão',
            'relação'    => 're-la-ção',
            'seres'        => 'se-res',
            'software'     => 'soft-ware',
        },
    ],
    # Default (English) patterns are expected to perform crappy
    # on Portuguese words! This test is here to make sure the
    # Portuguese patterns *were* loaded before and are *not* loaded now.
    [   'default',
        [],
        {   'Todos'        => 'To-dos',
            'consciência' => 'con-sciên-cia',
            'devem'        => 'de-vem',
            'dignidade'    => 'dig-nidade',
            'direitos'     => 'di-re-itos',
            'dotados'      => 'dota-dos',
            'espírito'    => 'es-píri-to',
            'fraternidade' => 'frater-nidade',
            'hardware'     => 'hard-ware',
            'humanos'      => 'hu-manos',
            'iguais'       => 'iguais',
            'livres'       => 'livres',
            'nascem'       => 'nascem',
            'outros'       => 'out-ros',
            'razão'       => 'razão',
            'relação'    => 're-lação',
            'seres'        => 'seres',
            'software'     => 'soft-ware',
        },
    ],
);

for my $lang ( @data ) {
    my($name, $opts, $words, $print) = @$lang;

    my $hyp = new_ok 'Text::Hyphen', $opts, "$name hyphenator";

    for my $word ( sort keys %$words ) {
        is $hyp->hyphenate($word), $words->{$word}, "$name: $word";
    }
}

done_testing;
