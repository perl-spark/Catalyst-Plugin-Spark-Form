
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Catalyst-Plugin-Spark-Form',
  NAME      => 'Catalyst::Plugin::Spark::Form',
  AUTHOR    => "Kent\ Fredric\ \<kentnl\@cpan\.org\>",
  ABSTRACT  => "A\ simple\ plug\-in\ to\ make\ forms\ accessible\ quickly\ off\ the\ CTX\.",
  VERSION   => '0.01000001',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "namespace::autoclean" => '0.09',
    "Spark::Form" => '0.2102',
    "Catalyst::Runtime" => '5.80004',
    "Moose" => '0.92',
  },
  test => {TESTS => 't/*.t'}
);

