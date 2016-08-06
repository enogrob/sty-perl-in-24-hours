  #!/usr/bin/perl -w
  use Fcntl qw(:flock);
  use CGI qw(:all);
  use CGI::Carp qw(fatalsToBrowser);
  use strict;
  my $surveyfile="/tmp/survey.txt";
  my @survey_answers=qw(pettype daytype clothes
            castaway travel risky ownpet
            realname comments);
  my $semaphore_file="/tmp/survey.sem";
 print header;
 if (! param ) {
      page_one();       # Survey just started
 } elsif (defined param('pageone')) {
      page_two();       # Answered one page, print the second
 } elsif (defined param('pagetwo')) {
      page_three();     # Print the last page.
 } else {
      survey_done();    # Print a thank-you note, and save
 }
