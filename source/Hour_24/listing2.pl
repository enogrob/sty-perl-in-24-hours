  #!/usr/bin/perl -w

  use strict;
  use Fcntl qw(:flock);
  use CGI qw(:all);

  my $lockfile='/tmp/webcount_lock';
  my $counterfile='/web/httpd/countfile';
  my $image_url='http://www.server.com/images';

sub get_lock {
   open(SEM, ">$lockfile")
       || die "Cannot create semaphore: $!";
   flock(SEM, LOCK_EX) || die "Lock failed: $!";
}
sub release_lock {
   close(SEM);
}
 get_lock();  # Get a lock, and wait for it.
 my $hits=0;
 if ( open(CF, $counterfile) ) {
     $hits=<CF>;
     close(CF);
 }
 $hits++;

 open(CF, ">$counterfile") || die "Cannot open $counterfile: $!";
 print CF $hits;
 close(CF);
 release_lock();  # Release the lock

 # Now, create the <IMG> tags.
 print header;
 foreach my $digit (split(//, $hits)) {
     print "<img src=\"$image_url/digit_$digit.jpg\"/>";
 }
