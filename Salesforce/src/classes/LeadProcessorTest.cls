@isTest
public class LeadProcessorTest {
    
    
    static testMethod void testing()
    {
        list<Lead> leadList = new list<Lead>();
        for(integer i=0;i<200;i++)
        {
           lead l = new lead();
            l.LastName = 'LastName'+i;
            l.Company = 'Company'+i;
            l.FirstName = 'frstiName'+i;
            leadList.add(l);
        }
        insert leadList;
        
   
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Database.executeBatch(lp);
        test.stoptest();
      //  Syatem.assertEquals()
        
    }
}