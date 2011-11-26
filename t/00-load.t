#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Wapiti::Parser' ) || print "Bail out!
";
}

diag( "Testing Wapiti::Parser $Wapiti::Parser::VERSION, Perl $], $^X" );
