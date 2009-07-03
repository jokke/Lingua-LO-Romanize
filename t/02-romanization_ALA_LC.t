#!perl -T

use warnings;
use strict;
use utf8;

use Lingua::LO::Romanize;
use Test::More;

my $words = [
    [qw/ ນາ             nā              nā                  /],
    [qw/ ນ່າ            nā              nā                  /],
    [qw/ ນ້າ            nā              nā                  /],
    [qw/ ນ໊າ            nā              nā                  /],
    [qw/ ນ໋າ            nā              nā                  /],
    [qw/ ອີກ            īk              īk                  /],
    [qw/ ຊະເອມ          sa-ēm           sa-ēm               /],
    [qw/ ບ້ານແກ້ງອີ     bānkǣng-ī       bān-kǣng-ī          /],
    [qw/ ຫລວງພະບາງ      lūangphabāng    lūang-pha-bāng      /],
    [qw/ ຫຍ້າ           nyā             nyā                 /],
    [qw/ ແຫນ            hǣn             hǣn                 /],
    [qw/ ແໜ             nǣ              nǣ                  /],
    [qw/ ວັດ            vat             vat                 /],
    [qw/ ທັນວາ          thanvā          than-vā             /],
    [qw/ ບ້ານວັດພຣະໄຊ   bānvatphrasai   bān-vat-phra-sai    /],
    [qw/ ສວາຽ           swāy            swāy                /],
    [qw/ ແຂວງ           khwǣng          khwǣng              /],
    [qw/ ສະຫວັນນະເຂດ    savannakhēt     sa-van-na-khēt      /],
    [qw/ ຊວາ            swā             swā                 /],
    [qw/ ຂວານ           khwān           khwān               /],
    [qw/ ສະວານ          savān           sa-vān              /],
    [qw/ ຄິວ            khiu            khiu                /],
    [qw/ ຕີວ            tīu             tīu                 /],
    [qw/ ຈົວ            chōua           chōua               /],
    [qw/ ນາວ            nao             nao                 /],
    [qw/ ແກວ            kèo             kèo                 /],
    [qw/ ດຽວ            diao            diao                /],
    [qw/ ເບີຣ໌          beur            beur                /],
    [qw/ເບຍ             bia             bia                 /],
    [qw/ ໐໑໒໓໔໕໖໗໘໙     0123456789      0123456789          /],
    [qw/ ໃຈ             chai            chai                /],
    [qw/ ເວລາ           véla            vé-la               /],
    [qw/ ສະຫນັບ         sanap           sa-nap              /],
    [qw/ ສະຫນູນ         sanoun          sa-noun             /],
    [qw/ ໃຫ້ແນ່ໃຈວ່າ    hainèchaiva     hai-nè-chai-va      /],
];

foreach my $pair (@$words) {
    my $rom = Lingua::LO::Romanize->new($pair->[0]);
    
    my $expected = $pair->[1];
    my $recieved = $rom->romanize(standard => 'ALA_LC');
    utf8::encode($expected) if utf8::is_utf8($expected);
    utf8::encode($recieved) if utf8::is_utf8($recieved);
    
    ok ( $recieved eq $expected, "should recieve '$expected' got '$recieved'");
    
    $expected = $pair->[2];
    $recieved = $rom->romanize(hyphen => 1, standard => 'ALA_LC');
    utf8::encode($expected) if utf8::is_utf8($expected);
    utf8::encode($recieved) if utf8::is_utf8($recieved);
    
    ok ( $recieved eq $expected, "should recieve '$expected' got '$recieved'");
}

done_testing;