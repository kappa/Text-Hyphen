use inc::Module::Install;

name     'Text-Hyphen';
all_from 'lib/Text/Hyphen.pm';

test_requires 'Test::More';

WriteAll;
