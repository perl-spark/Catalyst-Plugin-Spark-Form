package Catalyst::Plugin::Spark::Form;

# A simple plugin to make forms accessible quickly off the CTX.

# $Id:$
use strict;
use warnings;

use Moose::Role;
use namespace::autoclean;

=head1 SYNOPSIS

  use Catalyst qw/ Spark::Form /;

  ...

  sub action {
    my ( $self, $ctx, @rest ) = @_;

    $ctx->form('bar') # loads My::Project::Form::Bar or My::Project::F::Bar

  }

=cut

=head1 METHODS

=head2 form

  $ctx->form( $formname )

=cut

sub form {
  my ( $ctx, $name, @args ) = @_;

  if ($name) {
    my @result = $c->_comp_search_prefixes( $name, qw/Form F/ );
    if ( ref $name ) {
      return map { $c->_filter_component( $_, @args ) } @result;
    }
    return $c->_filter_component( $result[0], @args );
  }

  return $c->component( $c->action->class );

}

__PACKAGE__->meta->make_immutable;

no Moose;

=head1 CREDITS

Code thrown together by James Laver L<http://jameslaver.com>.

Code stolen from $c->controller.

=cut

=head1 DISCLAIMER

The code mightn't work, but its not my fault if it doesn't. Will gladly accept patches.

=cut

1;

