public class AccountNameA {
    
    public void query()
    {
        list<Account> count = new list<Account>();
        list<Account> acc = new list<Account>();
        acc = [SELECT Name FROM Account WHERE Name LIKE 'A%'];
        for(Integer i = 0;i<acc.size();i++)
        {
           acc[i].name = 'Updated via update DML operation';
            count.add(acc[i]);
            
        }
        update count;
        
        
    }

}