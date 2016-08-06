.  <!--assumes a program called /cgi-bin/mailer.cgi exists-->
.  <form method="post" action="/cgi-bin/mailer.cgi">
.  Your address: <input type="text" name="return_addr"/><br/>
.  Subject: <input type="text" name="subject"/><br/>
.  <br/>
.  Message:<br/>
.  <textarea name="body" rows="20" cols="60" wrap="hard">
.  Type your message here
.  </textarea>
. <br/>
. <input type="submit" VALUE="Send Message"/>
. </form>
