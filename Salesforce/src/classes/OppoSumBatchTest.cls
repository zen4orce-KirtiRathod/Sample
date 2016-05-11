@isTest
public class OppoSumBatchTest {
     
    static testMethod void test()
    {
        
        list<opportunity> op = new list<opportunity>();
        string query  = 'Select id,CloseDate,Amount,StageName from opportunity where StageName= \'Closed Won\' and CreatedDate=TODAY';
       		 
        Opportunity o=new Opportunity(Name='oppoptunity',CloseDate=Date.Today(),StageName='Closed Won',Amount=1000,ForecastCategoryName = 'Pipeline');
        	 op.add(o);   
        
        
        insert op;
        
       
        SchedualOpp sc = new SchedualOpp();
        String CRON_EXP = '0 0 0 15 4 ? 2016';
        Test.startTest();
        string jobId = System.schedule('SchedualTest',CRON_EXP,sc);
        
        CronTrigger ct = [select Id,CronExpression,TimesTriggered FROM CronTrigger WHERE id =: jobId];
        system.assertEquals(CRON_EXP, ct.CronExpression);
        Test.stopTest();
    }

}