#!/usr/bin/perl -w

  use strict;
  use CGI qw(:all);
  my($imagedir, $day, @jpegs, $error);

  $imagedir="/web/htdocs/pic_of_day";
  $error="/web/htdocs/images/error.jpg";

 sub display_image {
     my($image)=@_;
     open(IMAGE, "$image") || exit;
     binmode STDOUT; binmode IMAGE;
     print <IMAGE>;
     close(IMAGE);
     exit;
 }

 print header(-type => 'image/jpeg');

 # Day of the month, 1-28, 29, 30, or 31
 $day=(localtime)[3];
 $day=$day-1;    # We want day 0-27, etc..

 opendir(IMGDIR, $imagedir) || display_image($error);
 @jpegs=sort grep(/\.jpg$/, readdir IMGDIR);
 closedir(IMGDIR);
 
 my $image="$imagedir/$jpegs[$day]";
 $image=$error if (not defined $jpegs[$day]);
 display_image($image);
