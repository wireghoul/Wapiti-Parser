use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Wapiti::Parser',
    AUTHOR              => q{Eldar Marcussen <japh at justanotherhacker.com>},
    VERSION_FROM        => 'lib/Wapiti/Parser.pm',
    ABSTRACT_FROM       => 'lib/Wapiti/Parser.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Wapiti-Parser-*' },
);
