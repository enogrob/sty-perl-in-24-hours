 sub page_three {
      print<<END_PAGE_THREE;
 <form><p>
 Last page!  This information is optional!<br/>
 Your name:</p><p>
 <input type="text" name="realname"/><br/>
 Any comments about this survey:<br/>
 <textarea name="comments" cols="40" rows="10">
 </textarea>
 </p>
 <input type="submit" name="pagethree"
      value="Submit survey results"/>
 END_PAGE_THREE
      repeat_hidden();
      print "</form>";
 }
