package Fey::SQL::Pg;
our $VERSION = '0.003';
# ABSTRACT: Generate SQL with PostgreSQL specific extensions
use Moose;
use Method::Signatures::Simple;
use namespace::autoclean;

use Fey::SQL::Pg::Insert;
use Fey::SQL::Pg::Delete;

extends 'Fey::SQL';

method new_insert {
    return Fey::SQL::Pg::Insert->new(@_);
}

method new_delete {
    return Fey::SQL::Pg::Delete->new(@_);
}

__PACKAGE__->meta->make_immutable;

__END__
=pod

=head1 NAME

Fey::SQL::Pg - Generate SQL with PostgreSQL specific extensions

=head1 VERSION

version 0.003

=head1 AUTHOR

  Oliver Charles <oliver.g.charles@googlemail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Oliver Charles.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

