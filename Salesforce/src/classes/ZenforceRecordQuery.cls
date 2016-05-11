/*Create a Account Record with Name =”Zen4orce”. Create associated contacts.

Create a Custom field called Contact Count on Account . Query on Contact

where Account.Name =”Zen4orce” and count the associated contacts. Update

the custom field on Accounts with that count.*/

public class ZenforceRecordQuery {
    
    public void Query()
    {
        list<Contact> con = new list<Contact>();
        con = [SELECT  Name FROM Contact WHERE Account.Name = 'Zen4orce'];
        integer c = con.size();
        Account a = new Account();
        a = [SELECT id FROM Account Where Name='Zen4orce'];
        a.Contact_Count__c = c;
        update a;
        
    }

}