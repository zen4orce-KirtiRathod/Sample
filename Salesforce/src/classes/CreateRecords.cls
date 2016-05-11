/*Create a Account , Contact, Lead , Opportunity record through DML operations.*/
public class CreateRecords {
    
    public void record()
    {
        Account a = new Account(name = 'tom',Rating = 'Hot');
        Insert a;
        Lead l = new Lead(Company = 'SteelCo',LastName='Mali' );
        Insert l;
        Contact c = new Contact(LastName = 'Jadhv');
        Insert c;
        Opportunity op = new Opportunity(CloseDate = system.today(),Name = 'Bhaveshwari',StageName='Prospecting');
        Insert op;
    }

}