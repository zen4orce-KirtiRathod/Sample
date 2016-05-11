public with sharing  class  StringArrayTest {
	          
	
	public static list<String> generateStringArray(integer i)						
	{
		list<String> l = new list<String>();
		for(integer x =0;x<i ; x++)
		{
			l.add('Test '+x);
		}
		return l;
	 } 

}