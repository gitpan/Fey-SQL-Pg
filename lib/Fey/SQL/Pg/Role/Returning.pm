package Fey::SQL::Pg::Role::Returning;
our $VERSION = '0.003';
use Moose::Role;
use namespace::autoclean;

use Method::Signatures::Simple;
use MooseX::Params::Validate qw( validated_hash pos_validated_list );

has '_return' => (
    traits   => [ 'Array' ],
    is       => 'bare',
    isa      => 'ArrayRef',
    default  => sub { [] },
    handles  => {
        _add_returning_element    => 'push',
        returning_clause_elements => 'elements',
    },
    init_arg => undef,
);

method returning {
    my $count = @_ ? @_ : 1;
    my (@returning) = pos_validated_list(
        \@_,
        ( ( { isa => 'Fey::Types::SelectElement' } ) x $count ),
        MX_PARAMS_VALIDATE_NO_CACHE => 1,
    );

    for my $elt ( map { $_->can('columns')
                        ? sort { $a->name() cmp $b->name() } $_->columns()
                        : $_ }
                  map { blessed $_ ? $_ : Fey::Literal->new_from_scalar($_) }
                  @returning )
    {
        $self->_add_returning_element($elt);
    }

    return $self;
}

method returning_clause ($dbh)
{
    return unless $self->returning_clause_elements;

    my $sql = 'RETURNING ';
    $sql .=
        ( join ', ',
          map { $_->sql_with_alias($dbh) }
          $self->returning_clause_elements()
        );

    return $sql
}

1;

__END__
=pod

=head1 NAME

Fey::SQL::Pg::Role::Returning

=head1 VERSION

version 0.003

=head1 AUTHOR

  Oliver Charles <oliver.g.charles@googlemail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Oliver Charles.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

