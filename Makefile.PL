
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Asynchronous MongoDB client using AnyEvent',
  'AUTHOR' => 'Graham Barr',
  'BUILD_REQUIRES' => {},
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'AnyEvent-MongoDB',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'AnyEvent::MongoDB',
  'PREREQ_PM' => {
    'AnyEvent' => '5.271',
    'Digest::MD5' => '0',
    'List::Util::XS' => '0.01',
    'MongoDB' => '0.38',
    'Moose' => '0.98',
    'Tie::IxHash' => '0',
    'namespace::autoclean' => '0'
  },
  'VERSION' => '0.103620_001',
  'test' => {
    'TESTS' => 't/*.t'
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



