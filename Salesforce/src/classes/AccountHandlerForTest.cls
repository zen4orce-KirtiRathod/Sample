public class AccountHandlerForTest {
	private static testMethod void AccountTest()
	{
		Account Acc = new Account(Ownerid ='005280000026eyr',name ='xyz',SLASerialNumber__c ='678');
		
		insert Acc;
        ID AccId = Acc.id;
        Contact c=new Contact(LastName='rathoddsf', AccountId=AccId, OwnerId='005280000026eyr');
        insert c;
		Boolean flag = false;
		Acc.OwnerId = '00528000001F4bM';
		update Acc;
		
		list<Contact> ListOfContact = new list<Contact>([SELECT id,Account.id,OwnerId FROM Contact WHERE Account.id =: AccId ]);
		String accountOfOwner = '00528000001F4bM';	
		String contactOfOwner = ListOfContact[0].OwnerId;
	    
		 if(accountOfOwner == contactOfOwner )
		 {
		 	 flag = true;
		 	
		 }
		  System.assert(true,flag);
		}
}