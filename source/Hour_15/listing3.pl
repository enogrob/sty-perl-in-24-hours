 use Fcntl qw(:flock);
 # Any file name will do for semaphore.
 my $semaphore_file="/tmp/sample.sem";

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

