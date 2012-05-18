#!perl -T

use Test::More tests => 3;
use Wapiti::Parser;

my $obj = Wapiti::Parser->new;
ok( $obj->parse('t/vulnerabilities.xml'), 'parse file' );
ok( $obj->get_wapiti_info eq 'Wapiti 2.2.1', 'Wapiti version parsed correctly' );
ok( $obj->get_issue_count == 8, 'Correct number of bugs have been imported' );
