@isTest
public class AddPrimaryContactTest {
    @isTest
    public static void addContact()
    {
        list<Account> accLIst = new list<Account>();
        for(integer i= 0;i<50;i++)
        {
        	acclist.add(new Account(BillingState = 'NY' ,Name ='test'+i));
        }
        for(integer j =0;j<50;j++)
        {
            accList.add(new Account(BillingState = 'CA' ,Name = 'testing'+j));
        }
        insert acclist;
        Contact c = new Contact(FirstName = 'firstname',LastNAme = 'lastName');
        insert c;
        string state = 'CA';
        AddPrimaryContact ad = new AddPrimaryContact(c,state);
        Test.startTest();
        	System.enqueueJob(ad);
        Test.stopTest();
        
        
    }

}