   <%args>
   $comp=>''
   $newmessage=>''
   </%args>6:<%perl>
   if ($newmessage and $session{name}) {
       get_lock();
       my($id)=$application{lastid};    
       $id++;
       $application{"msg" . $id}="$session{name}#$newmessage";
       $application{lastid}=$id;
       release_lock();
   }
   </%perl>
   <& header.mas, title => "Grafitti Board" &>
   <%perl>
       foreach my $mesg (sort keys %application) {
           my($id,$person,$message);
           next if (not $mesg=~/msg/);
           $id=substr($mesg, 3); # Get the ID number
           ($person,$message)=split(/#/, $application{$mesg});
   </%perl>
           <blockquote>
           <% $message %>
           <b>--- <% $person %></b>
           </blockquote>
   %    }
   % if ($session{name}) {
       <hr/>
       <form method="post" action="/cgi/mason.pl" ><p>
       <input type="hidden" name="comp" value="<% $comp %>" />
       <textarea name="newmessage" rows="10" cols="60"></textarea></p>
       <p><input type="submit" value="Submit Scribbles"/></p>
   % } else {
       <i>Sorry, you have to be signed in to write to the 
       message board!</i>
   % }
   </form>
