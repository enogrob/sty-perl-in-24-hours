  %seen=();
  foreach (@stars) {
       $seen{$_} = 1;
  }
  @difference = grep(! $seen{$_}, @pols);
