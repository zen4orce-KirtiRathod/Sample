public class AddPrimaryContact implements Queueable {
    
    public Contact con;
    public String State;
    public AddPrimaryContact(Contact con,String State)
    {
       this.con = con;
        this.State = State;
    }
    public void execute(QueueableContext context)
    {
        list<Account> newList = new list<Account>();
        newlist = [SELECT id,Name,(SELECT id,firstName,Lastname FROM Contacts) FROM Account WHERE BillingState =: State];
        
        for(Account acc : newlist)
        {
            
        }
        
    }

}