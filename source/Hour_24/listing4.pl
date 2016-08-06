 print "<h2>Slashdot.Org's Headlines as of ",
     scalar(gmtime((stat $cache)[9])),
     "GMT </h2><p>Updated Hourly!</p>";

 open(CF, $cache) || die "Cannot open the cache: $!";
 my($title, $link);
 while(<CF>) {
     if (m,<title>(.*)</title>,) {
             $title=$1;
     }
     if (m,<url>(.*)</url>,) {
             $link=$1;
             print qq{<a href="$link">$title</a><br/>\n};

     }
 }
 print "Copyright Slashdot.Org, used with permission.";
 close(CF);
