  #!/usr/bin/perl -w

  open(MYFILE, "testfile") || die "opening testfile: $!";
  @stuff=<MYFILE>;
  close(MYFILE);
  # Actually, any manipulation can be done now.
  foreach(reverse(@stuff)) {
          print scalar(reverse($_));
  }
