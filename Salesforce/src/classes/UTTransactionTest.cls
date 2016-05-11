@isTest
public class UTTransactionTest {
    
    private Static testmethod void TestMyUt()
    {
        UT_Transaction__c u = new UT_Transaction__c();
        u.Amount__c = 74873;
        u.Switching_Fee__c = 'Yes';
        u.UT_Fund_Name__c  = 'huyi';
        u.Transaction_Type__c = 'Purchase(Switch In)';
        insert u;
		        
        
        
    }
    

}