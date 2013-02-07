
use strict;
use warnings;

use 5.008001;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Encrypted, expiring, compressed, serialized session data with integrity",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Test::Deep" => 0,
    "Test::Fatal" => 0,
    "Test::More" => "0.96",
    "Test::Tolerant" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Session-Storage-Secure",
  "EXE_FILES" => [],
  "LICENSE" => "apache",
  "NAME" => "Session::Storage::Secure",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Crypt::CBC" => 0,
    "Crypt::Rijndael" => 0,
    "Crypt::URandom" => 0,
    "Digest::SHA" => 0,
    "MIME::Base64" => "3.12",
    "Math::Random::ISAAC::XS" => 0,
    "Moo" => 0,
    "MooX::Types::MooseLike::Base" => "0.16",
    "Sereal::Decoder" => 0,
    "Sereal::Encoder" => 0,
    "namespace::clean" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.006",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



