  # Function for sending mail with an MTA like sendmail
  sub send_mail {
      my($to, $from, $subject, @body)=@_;

      # Change this as necessary for your system
      my $sendmail="/usr/lib/sendmail -t -oi -odq";

      open(MAIL, "|$sendmail") || die "Can't start sendmail: $!";
      print MAIL<<END_OF_HEADER;
 From: $from
 To: $to
 Subject: $subject

 END_OF_HEADER
     foreach (@body) {
             print MAIL "$_\n";
     }
     close(MAIL);
 }
