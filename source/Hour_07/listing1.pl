  %seen = ();
  foreach (@fishwords) {
     $seen{$_} = 1;
  }
  @uniquewords = keys %seen;
