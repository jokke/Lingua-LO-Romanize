package Lingua::LO::Romanize::Types;

use strict;
use utf8;

use Moose::Util::TypeConstraints;

use Lingua::LO::Romanize::Syllable;

=encoding utf-8

=head1 NAME

Lingua::LO::Romanize::Types - Types used in Lingua::LO::Romanize

=head1 VERSION

Version 0.09

=cut

our $VERSION = '0.09';

=head2 WordArr

An array reference of Word

=cut

subtype 'WordArr'
      => as 'ArrayRef[Lingua::LO::Romanize::Word]';

coerce 'WordArr'
    => from 'Str'
    => via {
        my $text_str = $_;
        return [] unless $text_str;
        my $words;
        foreach (split /\b/s, $text_str) {
            push @$words, Lingua::LO::Romanize::Word->new(word_str => $_);
        }
        $words;
    };

=head2 SyllableArr

An array reference of Syllable

=cut

subtype 'SyllableArr'
      => as 'ArrayRef[Lingua::LO::Romanize::Syllable]';

coerce 'SyllableArr'
    => from 'ArrayRef[Str]'
    => via {
        my $arr_ref = $_;
        my $syllables;
        foreach (@$arr_ref) {
            push @$syllables, Lingua::LO::Romanize::Syllable->new(syllable_str => $_);
        }
        $syllables;
    };

enum 'Standard' => qw(BGN_PCGN ALA_LC);

coerce 'Standard'
    => from 'Str',
    => via {
        return 'ALA_LC' if uc($_) eq 'ALA_LC';
        return 'BGN_PCGN';
    };
    
no Moose::Util::TypeConstraints;
1;
