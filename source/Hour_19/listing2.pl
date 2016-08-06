 sub page_one {
     print<<END_PAGE_ONE;
 <form>
 <p>Are you a "cat person" or a "dog person"?<br/>
 <input type="radio" name="pettype" value="dog"/>Dog<br/>
 <input type="radio" name="pettype" value="cat"/>Cat<br/>
 </p><p>
 Are you more of an early-riser or a night owl?<br/>
 <input type="radio" name="daytype" value="early"/>Early riser<br/>
 <input type="radio" name="daytype" value="late"/>Night Owl<br/>
 </p><p>
 At work, if you had a choice on how to dress....<br/>
 <input type="radio" name="clothes" value="casual"/>Casual<br/>
 <input type="radio" name="clothes" value="business"/>Business<br/>
 </p><p>
 If stranded on a desert island,
 who would you rather be stuck with?<br/>
 <input type="radio" name="castaway" value="ginger"/>Ginger<br/>39:  <input type="radio" 
name="castaway" value="marya"/>Mary-Anne<br/>
 <input type="radio" name="castaway" value="prof"/>Professor<br/>
 <input type="radio" name="castaway" value="skipper"/>Skipper<br/>
 <input type="submit" name="pageone" value="Next page"/></p>
 </form>
 END_PAGE_ONE
 }
