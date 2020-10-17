package Sympa::Telegram::Hook;

use WWW::Telegram::BotAPI;
use Sympa::Log;

use constant gettext_id => 'Sympa telegram hook';

use constant TOKEN => "***";
use constant CHAT_ID => "***";

sub post_archive {
  my $module  = shift;
  my $name    = shift;
  my $message = shift;
  my %options = @_;

  my $list = $message->{'context'};
  
  my $log = Sympa::Log->instance;
 
  my $api = WWW::Telegram::BotAPI -> new (
    token => TOKEN
  );
   
  my $result = eval { $api->getMe } or do {
	  $log->syslog('err', 'Telegram : got error message ' . $api->parse_error->{msg});
	  return 1;
  };

  $api->sendMessage ({
    chat_id => CHAT_ID,
    text => "New message on " . $list->{'name'} . "\@" . $list->{'domain'} . " from " . $message->get_header('from') . " : " . $message->get_header('subject'),
  });

  return 1;
}

1;
