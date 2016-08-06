  #!/usr/bin/perl -w

  use strict;
  use Fcntl qw(:flock);
  use CGI qw(:all);

  my $semaphore_file='/tmp/webcount_lock'; 
  my $counterfile='/web/httpd/countfile';
  sub get_lock {
     open(SEM, ">$semaphore_file")
         || die "Cannot create semaphore: $!";
     flock(SEM, LOCK_EX) || die "Lock failed: $!";
 }
 # Function to unlock
 sub release_lock {
    close(SEM);
 }
 get_lock();  # Get a lock, and wait for it.
 my $hits=0;
 if ( open(CF, $counterfile) ) {
     $hits=<CF>;
     close(CF);
 }
 $hits++;  # Increase the hits by 1.
 print header;
 print "You have had $hits visitors";

 open(CF, ">$counterfile") || die "Cannot open $counterfile: $!";
 print CF $hits;
 close(CF);

 release_lock();  # Release the lock
