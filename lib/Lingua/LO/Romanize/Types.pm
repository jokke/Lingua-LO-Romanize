package Lingua::LO::Romanize::Types;

use utf8;

#use Moose::Util::TypeConstraints;

use MooseX::Types -declare => [qw(
        WordArr
        SyllableArr
    )];

use MooseX::Types::Moose qw/Str ArrayRef/;

use Lingua::LO::Romanize::Syllable;

=encoding utf-8

=head1 NAME

Lingua::LO::Romanize::Types - Types used in Lingua::LO::Romanize

=head1 VERSION

Version 0.09

=cut

our $VERSION = '0.09';

=head2 Lingua::LO::Romanize::Types::WordArr

An array reference of Word

=cut

subtype WordArr
      => as 'ArrayRef[Lingua::LO::Romanize::Word]';

coerce WordArr
    => from Str
    => via {
        my $text_str = $_;
        my $words;
        foreach (split /\b/s, $text_str) {
            push @$words, Lingua::LO::Romanize::Word->new(word_str => $_);
        }
        $words;
    };

=head2 Lingua::LO::Romanize::Types::SyllableArr

An array reference of Syllable

=cut

subtype SyllableArr
      => as 'ArrayRef[Lingua::LO::Romanize::Syllable]';

coerce SyllableArr
    => from 'ArrayRef[Str]'
    => via {
        my $arr_ref = $_;
        my $syllables;
        foreach (@$arr_ref) {
            push @$syllables, Lingua::LO::Romanize::Syllable->new(syllable_str => $_);
        }
        $syllables;
    };

no MooseX::Types;
1;
