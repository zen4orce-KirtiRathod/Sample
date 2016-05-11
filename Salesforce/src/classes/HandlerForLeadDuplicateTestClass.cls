@isTest
public  class HandlerForLeadDuplicateTestClass {
    
    static testMethod void validatebeforeClassForBulkOperation()
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
    static testMethod void checkForDupliaction()
    {
        Lead l1 = new Lead(Phone = '1111111111', Email = 'test1@lead.com',LastName ='shivaji', Company ='project', leadSource = 'Open-Not Contacted');
    
        insert l1;
        Lead l2 = new Lead(Phone = '1111111111', Email = 'test1@lead.com',LastName ='shivaji', Company ='project', leadSource = 'Open-Not Contacted');
        
        try
        {
           insert l2;
        }
        catch(Exception e)
        {
            Boolean expectedExceptionThrown = e.getMessage().contains('Record already Exist')?true:false;
            System.assertEquals(expectedExceptionThrown,true);
        }
    }
    static testMethod void checkForSamePhoneNotEmail()
    {
        list<Lead> dup = new list<Lead>();
        Lead l3 = new Lead(Phone = '2222222222', Email = 'test2@lead.com', LastName = 'iuij',Company = 'projectserr',leadSource = 'Closed - Converted');
        Lead l4 = new Lead(Phone = '2222222222', Email = 'test3@lead.com' ,LastName = 'kjliu',Company = 'oiuroiqwef',leadSource ='Closed - Converted');
         dup.add(l3);
         dup.add(l4) ;      
          Test.startTest();
          insert dup;
          Test.stopTest();
        
    }
    static testMethod void checkForBeforeUpdate()
    {
       Lead l5 = new Lead(Phone = '4444444444', Email = 'test4@lead.com',LastName ='shivaji', Company ='project', leadSource = 'Open-Not Contacted');

       insert l5;
        Lead l4 = new Lead() ;
        l4  = [SELECT Email From Lead WHERE Email = 'test4@lead.com'];
      l4.Email = 'test6@lead.com';
      update l4;
        
        
    }
    static testMethod void checkforDuplicateBeforeUpdate()
    {
        Lead l6 = new Lead(Phone = '4444444444', Email = 'test4@lead.com',LastName ='shivaji', Company ='project', leadSource = 'Open-Not Contacted'); 
        try
        {
            insert l6;
        
        }  
        catch(Exception e)
        {
             Boolean expectedExceptionThrown = e.getMessage().contains('Record already Exist')?true:false;
             System.assertEquals(expectedExceptionThrown,true);
        
        }   
    
    
    }  
        
    
    }