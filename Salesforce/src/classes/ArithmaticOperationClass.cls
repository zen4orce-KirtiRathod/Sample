public class ArithmaticOperationClass {
    integer c;
    
    public integer operation(String op,integer a,integer b )
    {
        if(op == 'SUM')
        {
            c = a+b;
        }
        else if(op =='SUB')
        {
            
           c = a-b;
        }
        else if(op == 'MULT')
        {
            c = a*b;
        }
        else if(op =='DiV')
        {
            c = a/b;
        }
        else 
        {
            return null;
        }
        return c;
        
    }
}