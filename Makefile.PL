
use strict;
use warnings;



use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Fey::SQL::Pg',
                       'DISTNAME' => 'Fey-SQL-Pg',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.11'
                                               },
                       'AUTHOR' => 'Oliver Charles <oliver.g.charles@googlemail.com>',
                       'BUILD_REQUIRES' => {},
                       'ABSTRACT' => 'Generate SQL with PostgreSQL specific extensions',
                       'EXE_FILES' => [],
                       'VERSION' => '0.003',
                       'PREREQ_PM' => {
                                        'MooseX::StrictConstructor' => '0.08',
                                        'namespace::autoclean' => '0.09',
                                        'Method::Signatures::Simple' => '0.05',
                                        'MooseX::Params::Validate' => '0.13',
                                        'Fey::SQL' => '0.34',
                                        'Moose' => '0.90'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



