   <%args>
   $comp=>''
   $name=>$session{name}
   $bgcolor=>$session{bgcolor}
   </%args>

   % $session{name}=$name if $name;
   % $session{bgcolor}=$bgcolor if $bgcolor;

   <& header.mas, title => "Basic Preferences" &>
   <form method="get" action="/cgi/mason.pl" ><p>
   <input type=hidden name=comp value="<% $comp %>" />
   Username:<input type=text width=10 name="name" value="<% $name %>"/>
   </p><p>Background color:<blockquote>
   % for my $color (qw(blue red yellow white green)) {
       <% ucfirst($color) %> <input type="radio" name="bgcolor" 
       value="<% $color %>"
       <% ($bgcolor eq $color)?"checked":"" %>/><br/>
   % }
   </blockquote><p>
   <input type="submit" value="Save Changes"/>
