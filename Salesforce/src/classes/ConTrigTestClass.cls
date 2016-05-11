@isTest
public with sharing class ConTrigTestClass {
	//list<Contact> Cont = new list<Contact>(); 
	
	private static testMethod void ConTrigTestMethod()
	{
		
		
		
	  Boolean flag = true;
	  Contact c=new Contact(LastName='rathod', AccountId='0012800000GQTuO', OwnerId='005280000026eyr');
	  
	  List<Account> a=new List<Account>([select id,OwnerId from account where Id=:'0012800000GQTuO']);
	  insert c;
	  c.OwnerId='00528000001F4bM';
	  update c;
	  String accountOfOwner=a[0].OwnerId;
	  String contactOfOwner=c.OwnerId;
	  if(accountOfOwner ==contactOfOwner )
	  {
	 	 flag = false;
	 	
	 }
	  System.assert(true,flag);
	}
		
}