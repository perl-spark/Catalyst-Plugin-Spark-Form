
use strict;
use warnings;

use Module::Build;

my $build = Module::Build->new(
  module_name   => 'Catalyst::Plugin::Spark::Form',
  license       => 'perl',
  dist_abstract => "A\ simple\ plug\-in\ to\ make\ forms\ accessible\ quickly\ off\ the\ CTX\.",
  dist_name     => "Catalyst\-Plugin\-Spark\-Form",
  dist_author   => [
"Kent\ Fredric\ \<kentnl\@cpan\.org\>",
  ],
  requires      => {
    "namespace::autoclean" => '0.09',
    "Spark::Form" => '0.2102',
    "Catalyst::Runtime" => '5.80004',
    "Moose" => '0.92',
  },
  script_files => [ qw() ],
);

$build->create_build_script;
