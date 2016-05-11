public with sharing class AccountHandlerFor {
	
	 public static void afterUpdate(List<Account> newlist , List<account> oldlist)
     {
       Map<ID,Account> listOfUpdatedAccounts = new Map<id,Account>();
       
       for(integer i = 0 ; i<newList.size();i++)
       {
         if(newList[i].ownerid != oldlist[i].ownerid)
         {
             listOfUpdatedAccounts.put(newList[i].id,newList[i]);
             System.debug('listOfUpdatedAQccounts'+listOfUpdatedAccounts);
             
         }
       }
       
       List<contact> lstContacts = New List<contact>();
       lstContacts = [select ownerid,AccountId from contact where accountid in :listOfUpdatedAccounts.keyset()];
       
              List<contact> updateContacts = New List<contact>();
       
       for(Contact c : lstContacts )
       {
       		if( c.ownerid != listOfUpdatedAccounts.get(c.accountID).ownerId)
                 c.ownerid = listOfUpdatedAccounts.get(c.accountID).ownerId;
            updateContacts.add(c);
       } 
      
       if(updateContacts.size()>0)
       update updateContacts;
        
    }

}