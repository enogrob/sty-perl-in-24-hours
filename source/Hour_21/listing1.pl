  #!/usr/bin/perl -w
  use strict;
  use CGI qw(:all);
  use CGI::Carp qw(fatalsToBrowser);
  my($requested_color, $old_color, $color_cookie)=("","");
  $old_color="blue";  # Default value
  # Is there a new color requested?
  if (defined param('color')) {
      $requested_color=param('color');
 }
 # What was the old color, if any?
 if (defined cookie('bgcolor')) {
     $old_color=cookie('bgcolor');
 }
 if ($requested_color and ($old_color ne $requested_color)) {
     # Set the cookie in the browser
     $color_cookie=cookie(-name => 'bgcolor',
                          -value => $requested_color);
     print header(-cookie => $color_cookie);
 } else {
     # Nothing's changed, no need to set the cookie
     $requested_color=$old_color;
     print header;
 }
 print<<END_OF_HTML;
 <html>
 <head>
 <title>Set your background color</title>
 </head>
 <body bgcolor="$requested_color">
 <form>
 <select name="color">
         <option value='red'/>Red
         <option value='blue'/>Blue
         <option value='yellow'/>Yellow
         <option value='white'/>White
 </select>
 <input type="submit" value="Set the color"/>
 </form>
 </body>
 </html>
 END_OF_HTML
