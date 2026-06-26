package Number::Format::FitWidth;

use 5.010001;
use strict;
use warnings;

use Exporter qw(import);
use List::Util qw(max);

# AUTHORITY
# DATE
# DIST
# VERSION

our @EXPORT_OK = qw(
                       format_fitwidth
               );

sub format_fitwidth {
    my $opts = ref($_[0]) eq 'HASH' ? {%{shift()}} : {};
    # use DD; dd $opts;

    return unless @_;
    my @nums = @_;

    my $width = length(($opts->{max} // max(@nums)) + 0);

    my $template = "%".($opts->{zero_prefix} ? "0" : "").$width."d";
    #print "D: template=<$template>\n";

    map { sprintf($template, $_) } @nums;
}

1;
# ABSTRACT: Pad all number(s) to the same width that will fit the widest number

=head1 SYNOPSIS

 use Number::Format::FitWidth qw(format_fitwidth);

 format_fitwidth(1, 2, 10, 12);                     # => (" 1", " 2", "10", "12")
 format_fitwidth(1, 10, 100);                       # => ("  1", " 10", "100")

 # zero_prefix option
 format_fitwidth({zero_prefix=>1}, 1, 10, 100);     # => ("001", "010", "100")

 # max option
 format_fitwidth({max=>9999}, 1);                   # => ("   1")


 # TODO: decimals, negative number

 # TODO: thousands_sep option

 # TODO: decimal_point option

 # TODO: decimal_digits option


=head1 FUNCTIONS

=head2 format_fitwidth

Usage:

 @formatted = format_fitwidth( [ \%opts, ] @numbers)

Options:

=over

=item * max

=item * zero_prefix

Boolean.

=back


=head1 SEE ALSO

Other C<Number::Format::*> modules.

=cut
