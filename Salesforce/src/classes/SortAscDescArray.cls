public class SortAscDescArray {

	public void  ascendingNumber(list<Integer> a)
    {
        integer size = a.size();
        for(integer i= 0; i<size;i++)
        {
           integer  temp = a[i];
            for(integer j = 0;j<i;j++)
            {
                if(a[i] >a[j])
                {
                    temp= a[j];
                    a[i] = a[j];
                    a[i]= temp;
                }                                         
                
            }
        }
        system.debug(a);
       
       
        for(integer i= 0; i<size;i++)
        {
           
            for(integer j = i+1;j<size;j++)
            {
                if(a[i] < a[j])
                {
                   integer  temp = a[i];
                    a[i] = a[j];
                    a[j] = temp;
                }                                         
                
            }
        }
        system.debug(a);

    
     System.debug('Maximum Number :' + a[0]);
       
     System.debug('Minimum Number :' + a[a.size()-1]);

	Integer len=a.size();
		for(Integer i=0;i<len;i++)
		{
			Integer cnt=1;
			for(Integer j=i+1;j<len;j++)
			{
                if(a[i]==a[j])
				{
					i++;
                    cnt++;
				}
			}
            system.debug(a[i] +':'+ cnt);
        }
        
    
    }

}