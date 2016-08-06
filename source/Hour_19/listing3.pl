 # Print out any of the responses so far as hidden fields
 sub repeat_hidden {
      foreach my $answer ( @survey_answers ) {
          if (defined param($answer)) {
                print "<input type=hidden";
                print " name=\"$answer\" ";
                print " value=\"", param($answer),"\"/>\n";
           }
      }
 }
 sub page_two {
      my $pet=param('pettype');
     if (! defined $pet) {
           $pet="goldfish";
      }
      print<<END_PAGE_TWO;
 <form>
 <p>Would you rather...<br/>
 <input type="radio" name="travel" value="travel"/>Travel<br/>
 <input type="radio" name="travel" value="home"/>Stay at home<br/>
 </p><p>
 Do you consider yourself...<br/>
 <input type="radio" name="risky" value="yes"/>A daredevil<br/>
 <input type="radio" name="risky" value="no"/>Cautious<br/>
 </p><p>
 Do you own a $pet?<br/>
 <input type="radio" name="ownpet" value="$pet"/>Yes<br/>
 <input type="radio" name="ownpet" value="no"/>No<br/>
 </p>
 <input type="submit" name="pagetwo" value="Last Page"/>
 END_PAGE_TWO
      repeat_hidden();
      print "</form>";
 }
