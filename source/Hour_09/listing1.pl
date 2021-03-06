  #!/usr/bin/perl -w
  
  use strict;

  my @employees = (
      'Smith,Bob,123101,9.35,40',
      'Franklin,Alice,132912,10.15,35',
      'Wojohowicz,Ted,198131,6.50,39',
      'Ng,Wendy,141512,9.50,40',
     'Cliburn,Stan,131211,11.25,40',
 );

 sub print_emp {
     my($last,$first,$emp,$hourly,$time)=
         split(',', $_[0]);
     my $fullname;
     $fullname = sprintf("%s %s", $first, $last);
     printf("%6d %-20s %6.2f %3d %7.2f\n",
         $emp, $fullname, $hourly, $time,
         ($hourly * $time) + .005 );
 }

 @employees = sort {
     my ($L1, $F1)=split(',', $a);
     my ($L2, $F2)=split(',', $b);
     return( $L1 cmp $L2  # Compare last names
         ||   # If they're the same�
         $F1 cmp $F2  # Compare first
     );
 } @employees;

 foreach (@employees) {
     print_emp($_);
 }
