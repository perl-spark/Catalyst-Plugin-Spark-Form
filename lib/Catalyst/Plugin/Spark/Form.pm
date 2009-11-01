use strict;
use warnings;

package Catalyst::Plugin::Spark::Form;

# ABSTRACT: A simple plug-in to make forms accessible quickly off the CTX.

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
    my @result = $ctx->_comp_search_prefixes( $name, qw/Form F/ );
    if ( ref $name ) {
      return map { $ctx->_filter_component( $_, @args ) } @result;
    }
    return $ctx->_filter_component( $result[0], @args );
  }

  return $ctx->component( $ctx->action->class );

}

no Moose::Role;

=head1 CREDITS

Code thrown together by James Laver L<http://jameslaver.com>.

Code stolen from $c->controller.

=cut

=head1 DISCLAIMER

The code mightn't work, but its not my fault if it doesn't. Will gladly accept patches.

=cut

1;

