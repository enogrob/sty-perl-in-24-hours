#!/usr/bin/perl -wT
# tainting is enabled!
use strict;
use CGI qw(:all);

print header('text/plain');
# Explicitly set the path to something reasonable
$ENV{PATH}='/bin:/usr/bin';
my $dir=param('dirname');
# Only allow directory listings under /home/projects
if ($dir=~m,^(/home/projects/[\w/]+)$, ) {
    $dir=$1;   # This "untaints" the data, see "perldoc perlsec"
    print 'ls -l $dir';
}
