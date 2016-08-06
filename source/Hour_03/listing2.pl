  #!/usr/bin/perl -w

  $maxprimes=20;    # Stop when you've found this many
  $value=1;
  $count=0;
  while($count < $maxprimes) {
              $value++;
              $composite=0;  
  OUTER: for ($i=2; $i<$value; $i++) {
          for($j=$i; $j<$value; $j++) {
              if (($j*$i)==$value) {
                  $composite=1;
                  last OUTER;
              }
          }
      }
      if (! $composite) {
          $count++;
          print "$value is prime\n";
      }
  }
