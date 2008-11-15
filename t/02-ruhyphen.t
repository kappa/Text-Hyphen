#!/usr/bin/perl
use strict;
use warnings;

use Test::More qw/no_plan/;
use Test::Deep;
use utf8;
use Encode;

BEGIN { use_ok('TeX::Hyphen::Russian') };

#$TeX::Hyphen::DEBUG = 4;

my $hyp = new TeX::Hyphen::Russian;

ok($hyp, 'Hyphenator loaded');

my ($word, $result, $expected);

sub test_hyp ($$) {
    my ($word, $expected) = @_;
    my $result = $hyp->visualize($word);
    is($result, $expected, encode('utf-8', "hypenated \"$word\""));
}

test_hyp 'бездн', 'бездн';
test_hyp 'вакуумирование', 'ва-ку-у-ми-ро-ва-ние';
test_hyp 'выскажу', 'вы-ска-жу';
test_hyp 'соткешь', 'со-ткешь';

$hyp->_load_hyphen_tex(\@TeX::Hyphen::Russian::HYPHEN);

test_hyp 'representation', 'rep-re-sen-ta-tion';
test_hyp 'presents', 'presents';
test_hyp 'declination', 'dec-li-na-tion';
test_hyp 'peter', 'pe-ter';
test_hyp 'going', 'go-ing';
test_hyp 'leaving', 'leav-ing';
test_hyp 'multiple', 'mul-ti-ple';
test_hyp 'playback', 'play-back';
test_hyp 'additional', 'ad-di-tion-al';
test_hyp 'maximizes', 'max-i-mizes';
test_hyp 'programmable', 'pro-grammable';

cmp_deeply([$hyp->_make_result_list('7632016')], [0, 2, 5]);
cmp_deeply([$hyp->_make_result_list('9')], [0]);
cmp_deeply([$hyp->_make_result_list('8')], []);
cmp_deeply([$hyp->_make_result_list('111')], [0, 1, 2]);
cmp_deeply([$hyp->_make_result_list('444')], []);
