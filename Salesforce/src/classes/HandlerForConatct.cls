public class HandlerForConatct {
public static void afterinsert(List<Contact> newlist)
    {
    	System.debug('hello'); 
        List<String> accountList = new List<String>();
        for(Contact c : newlist)
        {
          accountList.add(c.AccountId);  
        }
        
        String  s = 'abc';
        
        Map<Id,Account> accountMap = new Map<id,Account>([SELECT id,ownerid from Account where id =:accountList]);
        
        System.debug(accountMap);
        for(Contact c : newList)
        {
            Account a = accountMap.get(c.AccountId);
                if(a != null && c.OwnerId != a.OwnerId)
                    c.OwnerId = a.OwnerId;
        }
        
        
    }
  
}