   #!/usr/bin/perl -w

   use strict;
   use CGI qw(param cookie header);
   use HTML::Mason;
   package HTML::Mason::Commands;
   use vars qw(%session %application);
   use Fcntl qw(:flock);
   sub get_lock {
       open(SEM, ">/tmp/mason.lock") ||
           die "Can't create lock: $!";
       flock(SEM, LOCK_EX) || die "Can't lock: $!";
   }
   sub release_lock {
       close(SEM);
   }
   package main;
   my(%args,$id,$comp);
   # Transform HTML form arguments into %args
   foreach my $key (param()) {
       my @values=param($key);
       $args{$key}=( @values == 1 ? $values[0] : \@values );
   }
   # Generate a session ID for the user
   $id=cookie('ID');
   if (not defined $id) {
       $id=time . "$$" . rand(1000000);   
   }
   print header(-cookie => cookie( -name => 'ID', -value => $id));
   my $session="/tmp/mason/sessions";
   # Launch the HTML::Mason component
   dbmopen(%HTML::Mason::Commands::session, "$session/dat$id", 0666) || die "$!";
   dbmopen(%HTML::Mason::Commands::application, "$session/app", 0666) || die "$!";
   my $interp = HTML::Mason::Interp->new(parser=>HTML::Mason::Parser->new(),
       comp_root=>'/tmp/mason/component', 
       data_dir=>'/tmp/mason/data');
   if ($comp=param("comp")) {
       eval { $interp->exec("/$comp",%args) };
       print "HTML::Mason Error: $@" if $@;
   } else {
       print "No component specified.";

   }
   dbmclose(%HTML::Mason::Commands::session);
   dbmclose(%HTML::Mason::Commands::application);
   while() { 	   # Clean out sessions,
       unlink $_ if -M > .5 #  older than a half-day.
   }
