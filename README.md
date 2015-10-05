# NAME

Text::Hyphen - determine positions for hyphens inside words

# SYNOPSIS

This module implements Knuth-Liang algorithm to find positions inside
words where it is possible to insert hyphens to break a line.

    use Text::Hyphen;

    my $hyphenator = new Text::Hyphen;

    print $hyphenator->hyphenate('representation');
    # prints rep-re-sen-ta-tion

# EXPORT

This version does not export anything and uses OOP interface.

# FUNCTIONS

## new(%options)

Creates the hyphenator object.

You can pass several options:

- min\_word

    Minimum length of word to be hyphenated. Shorter words are returned
    right away. Defaults to 5 for English.

- min\_prefix

    Minimal prefix to leave without any hyphens. Defaults to 2 for
    English.

- min\_suffix

    Minimal suffix to leave wothout any hyphens. Defaults to 2 for
    English.

## hyphenate($word, \[$delim\])

Hyphenates the `$word` by inserting `$delim` into hyphen positions.
`$delim` defaults to dash ("-").

# AUTHOR

Alex Kapranoff, `<kappa at cpan.org>`

# BUGS

Please report any bugs or feature requests to `bug-text-hyphen at rt.cpan.org`, or through
the web interface at [http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Text-Hyphen](http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Text-Hyphen).  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

# SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Text::Hyphen

You can also look for information at:

- RT: CPAN's request tracker

    [http://rt.cpan.org/NoAuth/Bugs.html?Dist=Text-Hyphen](http://rt.cpan.org/NoAuth/Bugs.html?Dist=Text-Hyphen)

- AnnoCPAN: Annotated CPAN documentation

    [http://annocpan.org/dist/Text-Hyphen](http://annocpan.org/dist/Text-Hyphen)

- CPAN Ratings

    [http://cpanratings.perl.org/d/Text-Hyphen](http://cpanratings.perl.org/d/Text-Hyphen)

- Search CPAN

    [http://search.cpan.org/dist/Text-Hyphen](http://search.cpan.org/dist/Text-Hyphen)

# ACKNOWLEDGEMENTS

Donald Knuth and Frank Liang for the algorithm.

Alexander Lebedev for all his valuable work on russian ispell
dictionaries and russian hyphenation patterns. See his archive
at [ftp://scon155.phys.msu.ru/pub/russian/](ftp://scon155.phys.msu.ru/pub/russian/).

Mark-Jason Dominus and Jan Pazdziora for [Text::Hyphenate](https://metacpan.org/pod/Text::Hyphenate) and [TeX::Hyphenate](https://metacpan.org/pod/TeX::Hyphenate)
modules on CPAN both of which are hopefully obsoleted by Text::Hyphen :)

Ned Batchelder for his public domain Python implementation of
Knuth-Liang algorithm available at [http://nedbatchelder.com/code/modules/hyphenate.html](http://nedbatchelder.com/code/modules/hyphenate.html).

# COPYRIGHT & LICENSE

Copyright 2008-2015 Alex Kapranoff.

This is free software; you can redistribute it and/or modify it under
the terms GNU General Public License version 3.
