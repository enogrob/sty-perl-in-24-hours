<form action="/cgi-bin/helpdesk.cgi" name="helpdesk">
<p>
Problem type:
<input type="radio" name="probtype" value="hardware"/>Hardware
<input type="radio" name="probtype" value="software"/>Software
<br/>
<textarea name="problem" rows="10" cols="40">
Describe your problem.
</textarea>
<br/>
Your name:
<input type="text" width="40" name="name"/><br/>
<input type="submit" name="submit" value="Submit Problem"/>
</form>
