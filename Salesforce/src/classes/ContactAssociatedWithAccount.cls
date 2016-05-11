/*Write a Method which find all the associated contact records of the Account and Print it*/

public class ContactAssociatedWithAccount {
    
    public void ConAsAc()
    {
        list<Contact> con = new list<Contact>();
        con = [SELECT AccountId,Name FROM Contact WHERE AccountId != null];
        for(Contact c : con)
        {
            system.debug(c);
        }
        
    }

}