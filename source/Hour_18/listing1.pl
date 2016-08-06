#!/usr/bin/perl -w
use strict;
use CGI qw(:standard);

print header;
print "<p>The name was", param('name'), "<br />";
print "The sex selected: ", param('sex'), "<br />";
print "The description was:<br />", param('description'),
      "</p>";
