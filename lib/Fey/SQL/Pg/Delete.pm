package Fey::SQL::Pg::Delete;
our $VERSION = '0.003';
use Moose;
use namespace::autoclean;

use Moose;
use MooseX::StrictConstructor;

extends 'Fey::SQL::Delete';
with 'Fey::SQL::Pg::Role::Returning';

around sql => sub {
    my $orig = shift;
    my ($self, $dbh) = @_;
    return ( join ' ',
             $self->$orig($dbh),
             $self->returning_clause($dbh)
           );
};


__PACKAGE__->meta->make_immutable;

__END__
=pod

=head1 NAME

Fey::SQL::Pg::Delete

=head1 VERSION

version 0.003

=head1 AUTHOR

  Oliver Charles <oliver.g.charles@googlemail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Oliver Charles.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

