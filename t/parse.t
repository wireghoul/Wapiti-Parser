#!perl -T

use Test::More tests => 1;
use Wapiti::Parser;

my $obj = Wapiti::Parser->new;
ok( $obj->parse('t/vulnerabilities.xml'), 'parse file');
