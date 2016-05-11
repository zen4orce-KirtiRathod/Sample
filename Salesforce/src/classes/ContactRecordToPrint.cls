/* Query on All Contact records & add all to the List and print that list.*/

public class ContactRecordToPrint {
    
    public void contactRecord()
    {
        list<Contact> con = new list<Contact>();
        con = [SELECT AccountId,AssistantName,AssistantPhone,Billing_Number__c,Name,Title FROM Contact];
        for(Contact c : con)
        {
            system.debug(c);
        }
    }

}