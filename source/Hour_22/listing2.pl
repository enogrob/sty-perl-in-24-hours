# Function for sending mail for systems without an MTA
sub send_mail {
     my($to, $from, $subject, @body)=@_;

     use Net::SMTP;

     # You will need to change the following line
     # to your mail relay host
     my $relay="relayhost.yourisp.com";
    my $smtp = Net::SMTP->new($relay);
    die "Could not open connection: $!" if (! defined $smtp);

    $smtp->mail($from);
    $smtp->to($to);

    $smtp->data();
    $smtp->datasend("To: $to\n");
    $smtp->datasend("From: $from\n");
    $smtp->datasend("Subject: $subject\n");
    $smtp->datasend("\n");
    foreach(@body) {
         $smtp->datasend("$_\n");
    }
    $smtp->dataend(); # Note the spelling: no "s"
    $smtp->quit;
}
