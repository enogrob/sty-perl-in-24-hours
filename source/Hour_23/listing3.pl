   <%args>
   $title => 'No Title'
   </%args>4:<%perl>
   my $user="Unknown user";
   # User name '0' is troublesome -- and ignored
   $user=$session{name} if $session{name}; 
   </%perl>
   <html>
   <head>
   <title><% $title %></title>
   </head>
   <body bgcolor=<% $session{bgcolor} %> >
   <table width="100%" border="1">
   <tr>
   <td width="25%"> <% $user %> </td>
   <td align="center" width="50%"><h3><% $title %></h3></td>
   <td align="right" width="25%"> <% scalar localtime %> </td>
   </tr>
   <tr> <td colspan="3" align="center">
   <a href="/cgi/mason.pl?comp=main.mas">Main Menu</a>
   </td> </tr>
   </table>
