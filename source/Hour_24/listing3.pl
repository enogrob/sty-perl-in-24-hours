
 print header;
 # If the cache is older than about an hour, rebuild it
 get_lock();
 if ( (not -e $cache ) or ( (-M $cache) > .04)) {
     my $doc=get($url);
     if (defined $doc) {
             open(CF, ">$cache") || die "Writing to cache: $!";
             print CF $doc;
             close(CF);
     }
 }
 release_lock();

