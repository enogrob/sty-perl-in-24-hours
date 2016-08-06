#!/usr/bin/perl -wT
use strict;
use CGI qw(:all);
use Fcntl qw(:flock);

# Location of the guestbook log file.  Change this to suit your needs
my $gbdata="c:/temp/guestbook";
# Any file name will do for semaphore.
my $semaphore_file="/tmp/helpdesk.sem";

# Function to lock (waits indefinitely)
sub get_lock {
   open(SEM, ">$semaphore_file") 
       || die "Cannot create semaphore: $!";
   flock SEM, LOCK_EX;
}
# Function to unlock
sub release_lock {
    close(SEM);
}

# This function saves a passed-in help desk HTML form to a file
sub save {
     get_lock();
     open(GB, ">>$gbdata") || die "Cannot open $gbdata: $!";
     print GB "name: ", param('name'), "\n";
     print GB "type: ", param('probtype'), "\n";
     print GB "problem: ", param('problem'), "\n";
     close(GB);
     release_lock();
}
# This function displays the contents of the help desk log file as HTML,
# with minimal formatting.
sub display {
     open(GB, $gbdata) || die "Cannot open $gbdata: $!";
     while(<GB>){
          print "<b>$_</b><br />";  # The name
          my($type,$prob);
          $type=<GB>;
          $prob=<GB>;
          print "$type<br />";
          print "$prob<br /><br />";
     }
     close(GB);
}

print header;
# The parameter 'submit' is only passed if this CGI program was
# executed by pressing the 'submit' button in the form in listing 18.7
if (defined param('submit')) {
     save;
     display;
} else {
     display;
}
