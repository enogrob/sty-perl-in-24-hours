  %seen=();
  foreach (@stars) {
       $seen{$_}=1;
  }
  @intersection=grep($seen{$_}, @pols);
