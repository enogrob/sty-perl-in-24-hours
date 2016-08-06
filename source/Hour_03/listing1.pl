  #!/usr/bin/perl -w

  $im_thinking_of=int(rand 10);
  print "Pick a number:";
  $guess=<STDIN>;
  chomp $guess;   # Don't forget to remove the newline!

  if ($guess>$im_thinking_of) {
      print "You guessed too high!\n";
 } elsif ($guess < $im_thinking_of) {
     print "You guessed too low!\n";
 } else {
     print "You got it right!\n";
 }
