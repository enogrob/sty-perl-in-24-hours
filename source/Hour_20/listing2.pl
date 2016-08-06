  #!/usr/bin/perl -w

  use CGI qw(:all);

  # The hour from localtime() is in 24-hour format
  my $hour=(localtime)[2];
  my $image;

  # Before 6am or after 6pm, it's nighttime
 if ($hour<6 or $hour>18) {
          $image="night.jpg";
 } else {
          $image="day.jpg";
 }
 print header;
 print qq{<img src="$image" ALT="$image"/>\n};
