  #!/usr/bin/perl -w

  use strict;

  my($dir, $oldpat, $newpat);
  print "Directory: ";
  chomp($dir=<STDIN>);
  print "Old pattern: ";
  chomp($oldpat=<STDIN>);
 print "New pattern: ";
 chomp($newpat=<STDIN>);

 opendir(DH, $dir) || die "Cannot open $dir: $!";
 my @files=readdir DH;
 close(DH);
 my $oldname;
 foreach(@files) {
     $oldname=$_;
     s/$oldpat/$newpat/;
     next if (-e "$dir/$_");
     if (! rename "$dir/$oldname", "$dir/$_") {
             warn "Could not rename $oldname to $_: $!"
     } else {
             print "File $oldname renamed to $_\n";
     }
 }
