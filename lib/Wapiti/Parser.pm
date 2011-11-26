package Wapiti::Parser;

use warnings;
use strict;

=head1 NAME

Wapiti::Parser - Parses wapiti reports

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Wapiti::Parser;

    my $foo = Wapiti::Parser->new();
    ...

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

sub function1 {
}

=head2 new

=cut

sub new {
    my ($class, %options) = @_;
    my $self = {};
    return bless $self, $class;
}

=head1 AUTHOR

Eldar Marcussen, C<< <japh at justanotherhacker.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-wapiti-parser at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Wapiti-Parser>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Wapiti::Parser


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Wapiti-Parser>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Wapiti-Parser>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Wapiti-Parser>

=item * Search CPAN

L<http://search.cpan.org/dist/Wapiti-Parser/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2011 Eldar Marcussen.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Wapiti::Parser
