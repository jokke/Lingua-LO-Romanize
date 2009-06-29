#!perl

use utf8;
use lib 'lib';
use Lingua::LO::Romanize;

# my $rom = Lingua::LO::Romanize->new(text => 'ວັນທີ 1 ມິຖຸນາ 2009 ເວລາ 15 ໂມງ ຢູ່ວິທະຍາເຂດດົງໂດກມະຫາວິທະຍາໄລແຫ່ງຊາດ ໄດ້ຈັດພິທີປູກຕົ້ນໄມ້ຂຶ້ນ ໂດຍ ການເຂົ້າຮ່ວມເປັນປະທານຂອງທ່ານ ຮສ ລຳໄມ ພິພັກຂະວົງ ຮອງອະທິການບໍດີ ຜູ້ຮັກສາການອະທິການບໍດີມະຫາວິທະຍາ ໄລແຫ່ງຊາດ, ທ່ານ ຮສ ດຣ ສາຍຂອງ ສາຍນາສິນ ຮອງອະທິການບໍດີ, ຄະນະບໍດີ, ຫົວຫນ້າຫ້ອງການ, ນາຍບ້ານອ້ອມຂ້າງ ວິທະຍາເຂດດົງໂດກ, ພະນັກງານ ຄູ-ອາຈານ ແລະນັກຮຽນ, ນັກສຶກສາຮ່ວມກັນປູກຕົ້ນໄມ້ລຽບຕາມເສັ້ນທາງ ເບື້ອງຊ້າຍ ແຕ່ ສາມແຍກເຂດໂຮງຮຽນມັດທະຍົມສົມບູນສາທິດດົງໂດກ ໄປເຖິງບ້ານພັກນັກກິລາຊີເກມ. ');
# 
# foreach my $word ($rom->all_words) {
#     foreach my $syll ($word->all_syllables) {
#         my $rom = $syll->romanize;
#         my $lao = $syll->syllable_str;
#         utf8::encode($rom);
#         utf8::encode($lao);
#         print "$lao \t=> $rom\n";
#     }
# }
my $rom = Lingua::LO::Romanize->new(text => 'ສະຫນັບ');
my $translated = $rom->romanize(hyphen => 1);
utf8::encode($translated);
print "$translated\n";
$rom->text('ແຫນ');
$translated = $rom->romanize(hyphen => 1);
utf8::encode($translated);
print "$translated\n";

$rom->text('ໃຈວ່າ');
$translated = $rom->romanize(hyphen => 1);
utf8::encode($translated);
print "$translated\n";
#$rom->text('ຂວານ');

#print $rom->romanize(hyphen => 1), "\n";
