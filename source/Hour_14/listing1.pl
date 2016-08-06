  #!/usr/bin/perl -w
  use strict;
  use File::Find;

  sub wanted {   
      if ($_ eq "important.doc") {
          print $File::Find::name;
      }
  }
 find \&wanted, '/documents';
