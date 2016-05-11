public with sharing class AccountHandler 
{
   public static Account insertNewAccount(String  a)
	{
	 Account acc = new Account(Name = a);
        try
		{
			insert acc;
        }
        catch(Exception e)
		{
			System.debug('A DML exception has occurred: '+ e.getMessage());
            acc= null;
        }
       return acc;
    
}
}