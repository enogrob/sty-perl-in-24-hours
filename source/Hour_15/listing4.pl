 #!/usr/bin/perl -w
 use strict;
 use Fcntl qw(:flock);

 my $semaphore_file="/tmp/list154.sem";

 # Function to lock (waits indefinitely)
 sub get_lock {
     open(SEM, ">$semaphore_file")
         || die "Cannot create semaphore: $!";
     flock(SEM, LOCK_EX) || die "Lock failed: $!";
 }

 # Function to unlock
 sub release_lock {
     close(SEM);
 }

 sub readdata {
     open(PH, "phone.txt") || die "Cannot open phone.txt $!";
     my(@DATA)=<PH>;
     chomp(@DATA);
     close(PH); 
     return(@DATA);
 }
 sub writedata {
      my(@DATA)=@_;
      open(PH, ">phone.txt") || die "Cannot open phone.txt $!";
      foreach(@DATA) {
          print PH "$_\n";
      }
      close(PH);   # Releases the lock, too
 }
 my @PHONEL;

 get_lock();
 @PHONEL=readdata();
 push(@PHONEL, "Calvin 555-1012");
 writedata(@PHONEL);
 release_lock()
