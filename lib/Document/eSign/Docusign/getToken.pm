package Document::eSign::Docusign::getToken;
use strict;
use warnings;
use Carp;
use Data::Dumper;

=head1 NAME

Document::eSign::Docusign::getToken - Retrieves an OAUTH2 token.

=head1 VERSION

Version 0.02

=cut

=head1 functions

=head2 getToken($varshashref)

Example:

    my $response = $ds->getToken(
        {
            grant_type => 'password', # only option
            scope      => 'api' # only option
        }
    );
    
=cut

sub new {
    carp("Got token request: " . Dumper(@_)) if $_[1]->debug;
    my $class = shift;
    my $main = shift;
    my $vars = shift;
    my $self = bless {}, $class;
    
    my $uri = '/v2/oauth2/token';
    
    # Build the portions of the get string as needed.
    
    my $creds = $main->buildCredentials();
    
    my $response = $main->sendRequest('POST', 'application/json', $creds, $main->defaultUrl . $uri, $vars);
    
    return $response;
}


1;
