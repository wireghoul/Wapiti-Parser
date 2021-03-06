package Wapiti::Parser;

use warnings;
use strict;
use XML::Parser;

=head1 NAME

Wapiti::Parser - Parses wapiti reports

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';
our $AUTHOR = 'Eldar Marcussen - http://www.justanotherhacker.com';

=head1 SYNOPSIS

Wapiti::Parser can parse wapiti xml reports so you can process them via perl. Use the -f xml switch with wapiti to generate xml reports.

Perhaps a little code snippet.

    use Wapiti::Parser;

    my $foo = Wapiti::Parser->new();
    $foo->parse('vulnerabilities.xml');

    ...

=head1 SUBROUTINES/METHODS

=head2 parse

Parses the Wapiti xml report

=cut

sub parse {
    my ($self, $filename) = @_;
    my $parser = new XML::Parser( Style => 'Tree' );
    my $tree = $parser->parsefile( $filename );
    $self->{'id'} = $tree->[1][4][0]{'id'};
    # Parse categories for issues
    for (my $x = 4; $x <= scalar( @{ $tree->[1][8] }); $x+=4) {
        my $category = $tree->[1][8][$x];
        my $cat_name = $category->[0]{'name'};
        my $cat_desc = $category->[8][2];
        my $cat_recc = $category->[12][2];
        my @bugs = @{ $category->[4] };
        #print "Buglist: ".scalar(@b)."\n";
        if (scalar(@bugs) > 1) {
            for (my $y = 4; $y <= scalar(@bugs); $y+=4) {
                $self->_add_issue($cat_name, $cat_desc, $cat_recc, $bugs[$y]->[0]{'level'}, $bugs[$y]->[4][2], $bugs[$y]->[8][2], $bugs[$y]->[12][2]);
            }
        }

    }
    $self->{'tree'} = $tree;
}

# Need to strip leading and trailing whitespace
sub _add_issue {
    my ($self, $name, $description, $solution, $level, $url, $example, $info) = @_;
    my $issue = {
        'category'	=> $name,
        'description'	=> $description,
        'solution'	=> $solution,
        'level'		=> $level,
        'url'		=> $url,
        'example'	=> $example,
        'info'		=> $info
    };
    push @{ $self->{'issues'} }, $issue;
}

    
=head2 new

Initializes the new object

=cut

sub new {
    my ($class, %options) = @_;
    my $self = {};
    $self->{'issues'} = [];
    $self->{'id'} = 'No wapiti file parsed';
    return bless $self, $class;
}

=head2 get_issue_count

Returns number of issues identified in the xml file

=cut

sub get_issue_count {
    my $self = shift;
    return 0 if !scalar( $self->{'issues'} );
    return scalar( @{ $self->{'issues'} });
}

=head2 get_all_issues

Returns an array of hashreferences, one hash reference per issue

=cut

sub get_all_issues {
    my $self = shift;
    return $self->{'issues'};
}

=head2 get_wapiti_info

Returns the wapiti version of the parsed xml file

=cut

sub get_wapiti_info {
    my $self = shift;
    return $self->{'id'};
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
