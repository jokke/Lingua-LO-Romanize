package Lingua::LO::Romanize::Syllable;

use utf8;

use Moose;
use MooseX::Params::Validate;

use constant{
    ROMAN => {
        BGN_PCGN => {
            #consonants
            ກ   => 'k',
            ຂ   => 'kh',
            ຄ   => 'kh',
            ງ   => 'ng',
            ຈ   => 'ch',
            ສ   => 's',
            ຊ   => 'x',
            ຕ   => 't',
            ຖ   => 'th',
            ທ   => 'th',
            ນ   => 'n',
            ໜ   => 'n',
            ປ   => 'p',
            ຜ   => 'ph',
            ຝ   => 'f',
            ພ   => 'ph',
            ຟ   => 'f',
            ມ   => 'm',
            ໝ   => 'm',
            ຢ   => 'y',
            ຣ   => 'r',
            ຣ໌  => 'r',
            ລ   => 'l',
            ຼ   => 'l',
            ຫ   => 'h',
            ຮ   => 'h',
            #ຍ, ຽ, ດ, ບ, ວ, ອ special cases
            #vowels
            ະ       => 'a',
            ັ       => 'a',
            າ       => 'a',
            ິ       => 'i',
            ີ       => 'i',
            ຶ       => 'u',
            ື       => 'u',
            ຸ       => 'ou',
            ູ       => 'ou',
            ເະ      => 'é',
            ເັ      => 'é',
            ເ       => 'é',
            ແະ      => 'è',
            ແັ      => 'è',
            ແ       => 'è',
            ໂະ      => 'ô',
            ົ       => 'ô',
            ໂ       => 'ô',
            ເາະ     => 'o',
            ັອ      => 'o',
            ໍ       => 'o',
            ອ       => 'o',
            ເັຽະ    => 'ia',
            ັຽ      => 'ia',
            ເັຽ     => 'ia',
            ຽ       => 'ia',
            ເັຍະ    => 'ia', #?
            ັຍ      => 'ia', #?
            ເັຍ     => 'ia', #?
            ຍ       => 'ia', #?
            ເຍ      => 'ia',
            ເຶອະ    => 'ua',
            ເຶອ     => 'ua',
            ເືອ     => 'ua',
            ເິະ     => 'eu',
            ເິ      => 'eu',
            ເີ      => 'eu',
            ເື      => 'eu',
            ໄ       => 'ai',
            ໃ       => 'ai',
            ເົາ     => 'ao',
            ຳ       => 'am', #not needed?
            ໍາ      => 'am', #not needed?
            ິວ      => 'iou',
            ີວ      => 'iou',
            # special case: ົວະ, ັວ, ົວ, ວ
        },
        ALA_LC => {
            #consonants
            ກ   => 'k',
            ຂ   => 'kh',
            ຄ   => 'kh',
            ງ   => 'ng',
            ຈ   => 'ch',
            ສ   => 's',
            ຊ   => 's',
            ຕ   => 't',
            ຖ   => 'th',
            ທ   => 'th',
            ນ   => 'n',
            ໜ   => 'n',
            ປ   => 'p',
            ຜ   => 'ph',
            ຝ   => 'f',
            ພ   => 'ph',
            ຟ   => 'f',
            ມ   => 'm',
            ໝ   => 'm',
            ຢ   => 'y',
            ຣ   => 'r',
            ຣ໌  => 'r',
            ລ   => 'l',
            ຼ   => 'l',
            ຫ   => 'h',
            ຮ   => 'h',
            #vowels
            ະ       => 'a',
            ັ       => 'a',
            າ       => 'ā',
            ິ       => 'i',
            ີ       => 'ī',
            ຶ       => 'ư',
            ື       => 'ư̄',
            ຸ       => 'u',
            ູ       => 'ū',
            ເະ      => 'e',
            ເັ      => 'e',
            ເ       => 'ē',
            ແະ      => 'æ',
            ແັ      => 'æ',
            ແ       => 'ǣ',
            ໂະ      => 'o',
            ົ       => 'o',
            ໂ       => 'ō',
            ເາະ     => 'ǫ',
            ັອ      => 'ǫ',
            ໍ       => 'ǭ',
            ອ       => 'ǭ',
            ເິະ     => 'œ',
            ເິ      => 'œ',
            ເີ      => 'œ̄',
            ເື      => 'œ̄',
            ເັຽະ    => 'ia',
            ັຽ      => 'ia',
            ເັຽ     => 'īa',
            ຽ       => 'īa',
            ເັຍະ    => 'ia',
            ັຍ      => 'ia',
            ເັຍ     => 'īa',
            ຍ       => 'īa',
            ເຍ      => 'īa', #no reference
            ເຶອະ    => 'ưa',
            ເຶອ     => 'ưa',
            ເືອ     => 'ư̄a',
            ໄ       => 'ai',
            ໃ       => 'ai',
            ເົາ     => 'ao',
            ຳ       => 'am', #not needed?
            ໍາ      => 'am', #not needed?
            ິວ      => 'iu',
            ີວ      => 'īu',
        },
    },
};

=encoding utf-8

=head1 NAME

Lingua::LO::Romanize::Syllable - Class for syllables, used by Lingua::LO::Romanize::Word.

=head1 VERSION

Version 0.09

=cut

our $VERSION = '0.09';

has 'syllable_str' => (
    is          => 'ro',
    isa         => 'Str',
    required    => 1,
);

=head1 SYNOPSIS

L<Lingua::LO::Romanize::Syllable> is used by L<Lingua::LO::Romanize::Word> and L<Lingua::LO::Romanize> to syllables of words. It is recommended to use L<Lingua::LO::Romanize> instead of this class directly (even if it is possible).

    use Lingua::LO::Romanize::Syllable;

    my $foo = Lingua::LO::Romanize::Syllable->new(syllable_str => 'ລາວ');

    my $bar = $foo->romanize;           # $bar will hold the string 'lao'
    $bar = $foo->romanize;              # $bar will hold the string 'lao'
    $bar = $foo->syllable_str;              # $bar will hold the string 'ລາວ'
    
For more information, please see L<Lingua::LO::Romanize>

=head1 METHODS

=head2 new

Creates a new object, syllable_str is required.

=head2 romanize

Romanize a syllable accourding to the BGN/PCGN standard.

Please see L<Lingua::LO::Romanize> for more information.

=head2 syllable_str

Returns the original syllable in Lao characters.

=head2 BGN_PCGN

A constant hash reference for romanization mapping accourding to BGN/PCGN.

=cut

sub romanize {
    my $self = shift;
    my ( $standard ) = validated_list( \@_,
                standard => { 
                    isa         => 'Standard', 
                },
              );
    
    my $syllable = $self->syllable_str;
    my $romanized_str;
    
    $syllable =~ s/[່-໋]//;
    
    return '...' if $syllable =~ /^ຯ$/;
    
    if ($syllable =~ /^[໐-໙]+$/) {
        foreach (split //, $syllable) {
            $romanized_str .= (ord($_) - 3792) if /^[໐-໙]$/;
        }
        return $romanized_str;
    }
    
    $syllable =~ s/^ຫ([ເ-ໄ]?[ນມ])/$1/;
    
    return $syllable
        unless $syllable =~ /^[ເ-ໄ]?([ກຂຄງຈສຊຍຽດຕຖທນບປຜຝພຟມຢຣລຼວຫອຮໜໝ])/;
    
    my $consonant = $1;
    
    #ຍ, ຽ, ດ, ບ, ວ, ອ
    if ($consonant =~ /^[ຍຽ]$/) {
        if ($standard eq 'ALA_LC') {
            $romanized_str = 'ny';
        } else {
            $romanized_str = 'gn';
        }
    } elsif ($consonant =~ /^ດ$/) {
        $romanized_str = 'd';
    } elsif ($consonant =~ /^ບ$/) {
        $romanized_str = 'b';
    } elsif ($consonant =~ /^ວ$/) {
        $romanized_str = 'v';
    } elsif ($consonant =~ /^ອ$/) {
        if ($standard eq 'ALA_LC') {
            $romanized_str = '‘';
        } else {
            $romanized_str = '-';
        }
    } elsif (defined (ROMAN->{$standard}->{$consonant})) {
        $romanized_str = ROMAN->{$standard}->{$consonant};
    }
    
    if ($consonant =~ /^ຫ$/ && $syllable =~ /^[ເ-ໄ]?ຫ([ຍຣລຼວ])/) {
        my $sec_consonant = $1;
        $consonant .= $1;
        if ($sec_consonant =~ /ຍ/) {
            if ($standard eq 'ALA_LC') {
                $romanized_str = 'ny';
            } else {
                $romanized_str = 'gn';
            }
        } elsif ($sec_consonant =~ /ວ/) {
            $romanized_str = 'v';
        } elsif (defined (ROMAN->{$standard}->{$sec_consonant})) {
            $romanized_str = ROMAN->{$standard}->{$sec_consonant};
        }
    } elsif ($syllable =~ /^[ເ-ໄ]?$consonant(ວ)./) {
        $consonant .= $1;
        if ($standard eq 'ALA_LC') {
            $romanized_str .= 'w'; # I believe this would be the way to romanize accourding to ALA_LC
        } else {
            $romanized_str .= 'o';
        }
    } elsif ($syllable =~ /^[ເ-ໄ]?$consonant([ຣລຼ])/) { # ວ, ຣ, or ລ (also ຼ) can be used in combination with another consonant
        my $sec_consonant = $1;
        $consonant .= $sec_consonant;
        if (defined (ROMAN->{$standard}->{$sec_consonant})) {
            $romanized_str .= ROMAN->{$standard}->{$sec_consonant};
        }
    }
    
    #vowel
    my $vowel = '';
    my $final_consonant;
    if ($syllable =~ /^([ເ-ໄ]?)$consonant/) {
        $vowel .= $1 if $1;
    }
    if ($syllable =~ /^[ເ-ໄ]?$consonant([ະັາິີຶືຸູະັົອໍວຽຍຳ]*)/) {
        $vowel .= $1 if $1;
    }
    if ($syllable =~ /^[ເ-ໄ]?$consonant(?:[ະັາິີຶືຸູະັົອໍວຽຍຳ]*)([ກງຍຽດນບມຣວ]|ຣ໌)?$/) {
        $final_consonant = $1 if $1;
    }
        
    return $romanized_str . 'am' if ($vowel =~ /^(?:ໍາ|ຳ)/);
    
    if (defined (ROMAN->{$standard}->{$vowel})) {
        $romanized_str .= ROMAN->{$standard}->{$vowel};
    } elsif ($vowel =~ /^ົວະ$/ || $vowel =~ /^ັວ$/) { # references are unclear for ALA_LC
        if ($standard eq 'ALA_LC') {
            $romanized_str .= 'ua';
        } else {
            $romanized_str .= 'oua';
        }
    } elsif ($vowel =~ /^ົວ$/ || $vowel =~ /^ວ$/) { # references are unclear for ALA_LC
        if ($standard eq 'ALA_LC') {
            $romanized_str .= 'ūa';
        } else {
            $romanized_str .= 'oua';
        }
    } elsif ($vowel =~ s/([ອວຽຍ])$// && defined (ROMAN->{$standard}->{$vowel})) {
        $final_consonant = $1;
        $romanized_str .= ROMAN->{$standard}->{$vowel};
    } 
    
    # last character
    if ($final_consonant) {
        if ($final_consonant =~ /ວ/) {
            $romanized_str .= 'o';
        } elsif ($final_consonant =~ /ດ/) {
            $romanized_str .= 't';
        } elsif ($final_consonant =~ /ບ/) {
            $romanized_str .= 'p';
        } elsif ($final_consonant =~ /[ຍຽ]/) {
            $romanized_str .= 'y';
        } elsif (defined (ROMAN->{$standard}->{$final_consonant})) {
            $romanized_str .= ROMAN->{$standard}->{$final_consonant};
        }
    }
    
    return $romanized_str;
}

=head1 AUTHOR

Joakim Lagerqvist, C<< <jokke at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-lingua-lo-romanize at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Lingua-LO-Romanize>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SEE ALSO

L<Lingua::LO::Romanize>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Joakim Lagerqvist, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

no Moose;
__PACKAGE__->meta->make_immutable;

1; # End of Lingua::LO::Romanize::Syllable
