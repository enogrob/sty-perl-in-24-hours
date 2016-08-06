  #!/usr/bin/perl -w

  print "Your weight:";
  $_=<STDIN>;
  chomp;
  s/^\s+//;   # Remove leading spaces, if any.
  if (m/(lbs?|kgs?|kilograms?|pounds?)/i) {
          if (s/\s*(kgs?|kilograms?).*//) {
                 $_*=2.2;
          } else {
                 s/\s*(lbs?|pounds?).*//;
          }
  }
  print "Your weight on the moon: ", $_*.16667, " lbs\n";
