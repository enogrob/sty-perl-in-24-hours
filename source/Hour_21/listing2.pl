  #!/usr/bin/perl -w

  use strict;
  use CGI qw(:all);

  print header();

  print "Cookies set that can be seen:<P>";

 foreach my $cookie (cookie()) {
     print "<p>Cookie name: $cookie <br/>";
     print qq{Cookie value: "}, cookie($cookie), qq{"</p><hr/>};
 }
