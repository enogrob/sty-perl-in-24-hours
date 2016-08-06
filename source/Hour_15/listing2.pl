  #!/usr/bin/perl -w
  use strict;

  my(%answers, $subject, $info, $pattern);

  dbmopen(%answers, "answers", 0666) || die "Cannot open answer DBM: $!";
  while(1) {
      print "Your question ('quit' to quit): ";
      chomp($_=lc(<STDIN>));
     last if (/^quit$/);
     if (/like\s+(.*)\?/) {
         $pattern=$1;
         while( ($subject,$info)=each(%answers) ) {
             if ($subject=~/$pattern/) {
                 print "$subject is like $pattern\n";
             }
         }
     } elsif (/(.*)\?/) {
         $subject=$1;
         if ($answers{$subject}) {
             print "$subject is $answers{$subject}\n";
         } else {
             print qq{I don't know about "$subject"\n};
         }
     } elsif (/(.*)\sis\s(.*)/) {
         $subject=$1;
         $info=$2;
         $answers{$subject}=$info;
         print qq{Ok, I'll remember "$subject" as "$info"\n};
     } else {
         print "I'm sorry, I don't understand.\n";
     }
 }
 dbmclose(%answers);
