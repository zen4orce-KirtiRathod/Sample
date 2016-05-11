public class AccountObjectQuery {
    
  list<Account> acc = new list<Account>();
  // acc  = Database.query(new selectall('Account').soql);
   // list<Account> acc  = Database.query(new selectall('Account').soql);
    public void query()
    {
   		 acc = [SELECT Id from Account];
        for(Integer i = 0;i< acc.size();i++)
        {
           system.debug(acc[i]);
        }
        for(Account a : acc)
        {
            system.debug(a);
        }
        integer count = 0;
        while(count <acc.size())
        {
            system.debug(acc[count]);
        }
}
}