  sub survey_done {
      save();
      print "Thank You!";
  }
 #
 # Save all of the survey results to $surveyfile
 #
 sub save {
      get_lock();
      open(SF, ">>$surveyfile") || die "Cannot open $surveyfile: $!";
      foreach my $answer (@survey_answers) {
           if (defined param ($answer) ) {
                print SF $answer, "=", param($answer), "\n";
           }
      }
     close(SF);
     release_lock();
 }
 #
 # Locks and Unlocks the survey file so that multiple survey-takers
 # Don't clash and write at the same time.
 #

# Function to lock (waits indefinitely)
sub get_lock {
   open(SEM, ">$semaphore_file") 
       || die "Cannot create semaphore: $!";
   flock SEM, LOCK_EX;
}

 Function to unlock
sub release_lock {
   close(SEM);
}

