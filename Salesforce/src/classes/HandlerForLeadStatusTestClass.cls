@isTest
public  class HandlerForLeadStatusTestClass {
	
	static testMethod void afterInsertBulkOperation()
	{
		list<Lead> bulkLead = new list<Lead>();//bulkify Operation
        Lead leadobj;
        for(integer i =0;i<=20;i++)
        {
           leadObj = new Lead(); 
           leadObj.Phone = '7111111111'+i  ;
           leadObj.Email = 'test1'+i+'1@gmail.com';
           leadObj.LastName = 'boe'+i;
           leadObj.Company = 'boee'+i;
           leadObj.LeadSource = 'Open-Not Contacted';
           bulkLead.add(leadObj);
            
        }
        
        Test.startTest();
        insert bulkLead;
        Test.stopTest();
    }
    static testMethod void SimpleInsert()
    {
         Lead l1 = new Lead(Phone = '1111111111', Email = 'test1@lead.com',LastName ='shivaji', Company ='project', leadSource = 'Closed - Converted');
    
         insert l1;
         
        
    }
    static testMethod void afterInsertCheck()
    {
        Lead l1 = new Lead(Phone = '1111111111', Email = 'test1@lead.com',LastName ='shivaji', Company ='project', leadSource = 'Open-Not Contacted');
    
        insert l1;
        
        Lead l2 = new Lead();
        l2 = [SELECT id,Status FROM LEAD WHERE Email ='test1@lead.com' AND Status = 'Working - Contacted'];
        System.assertEquals('Working - Contacted',l2.Status);
        
     }
    static testMethod void afterInsertCheckAndCreateDup()
    {
         Lead l1 = new Lead(Phone = '1111111111', Email = 'test1@lead.com',LastName ='shivaji', Company ='project', leadSource = 'Open-Not Contacted');
    
        insert l1;
        
        Lead l2 = new Lead();
        l2 = [SELECT id,Status FROM LEAD WHERE Email ='test1@lead.com' AND Status = 'Working - Contacted'];
        System.assertEquals('Working - Contacted',l2.Status);
        l2.Status = 'Open-Not Contacted';
        update l2;
        
       
    }
    
    
    
	}