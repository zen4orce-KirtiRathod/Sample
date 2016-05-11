public class FibbonaciSeries {
    
 	public void fib(integer a)
 	{
         integer[] feb = new integer[a];
         feb[0] = 0;
         feb[1] = 1;
         for(integer i=2; i < a; i++)
         {
             feb[i] = feb[i-1] + feb[i-2];
         }
 
         for(integer i=0; i< a; i++)
         {
                 System.debug(feb[i] );
         }
    }
}