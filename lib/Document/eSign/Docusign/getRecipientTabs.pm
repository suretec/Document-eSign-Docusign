package Document::eSign::Docusign::getRecipientTabs;
use strict;
use warnings;
use Carp;
use Data::Dumper;

=head1 NAME

Document::eSign::Docusign::getRecipientTabs - This retrieves information abotu the tabs associated with a recipient

=head1 VERSION

Version 0.04

=cut

=head1 functions

=head2 getRecipientTabs($parent, $vars)

Basic Example:
    my $response = $ds->getRecipientTabs(
        {
            accountId => $ds->accountid,
            envelopeId => 'Hello Signer World!',
            recipientId => 'GUID-OF-TEMPLATE-FROM-TEMPLATES',
        }
    );
    
    print "Got envelopeId: " . $response->{envelopeId} . "\n";
    
=cut

sub new {
    carp("Got recipient tabs request: " . Dumper(@_)) if $_[1]->debug;
    my $class = shift;
    my $main = shift;
    my $vars = shift;
    
    my $self = bless {}, $class;
    
    my $uri = qq{/envelopes/$vars->envelopeId/recipients/$vars->recipientId/tabs};
        
    my $creds = $main->buildCredentials();
    
    my $response = $main->sendRequest('GET', undef, $creds, $main->baseUrl . $uri, $vars);
    
    return $response;
}


1;
