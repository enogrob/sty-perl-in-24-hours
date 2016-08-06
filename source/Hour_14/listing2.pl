  #!/usr/bin/perl -w
  use strict;
  use File::Find;

  sub wanted {
     # Check to see if the filename is not a directory
     if ( -f $File::Find::name ) {
         # Verify the filename eds in .tmp
         if ( $File::Find::name=~/\.tmp$/i) {
            print "Removing $File::Find::name";
            unlink $File::Find::name;
        }
    }
 }
 find(\&wanted, 'c:/', 'd:/');
