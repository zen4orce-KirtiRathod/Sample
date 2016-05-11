public class MethodToReverseString {
    
    public void reverseString(String a)
    {
        String rev;
     	integer l = a.length();
        system.debug(l);
        for(integer i =l-1;i>=0;i--)
        {
            
            rev  = rev +a.substring(i,i+1); 
        }
        system.debug(rev);
    }

}