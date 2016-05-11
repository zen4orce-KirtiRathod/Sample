@isTest
public  class HandlerForLeadTestClass {
	
	static TestMethod void insertaLead()
	{
		list<Lead> bulkLead = new list<Lead>();//bulkify Operation
        Lead leadobj;
        for(integer i =0;i<=4;i++)
        {
           leadObj = new Lead(); 
           leadObj.Phone = '20'+i+'11111111'  ;
           leadObj.Email = 'test1'+i+'1@gmail.com';
           leadObj.LastName = 'boe'+i;
           leadObj.Company = 'boee'+i;
           leadObj.Status = 'Open-Not Contacted';
           bulkLead.add(leadObj);
            
        }
        
        Test.startTest();
        insert bulkLead;
        Test.stopTest();
    }
	static TestMethod void checkFornotUpdated()
	{
		Lead l = new Lead();
		l.Phone = '3087809809';
		l.Email = 'test@gami.com';
		l.LastName = 'rancho';
		l.Company = 'xyz';
		l.Status = 'Open-Not Contacted';
		
	    insert l;
	    System.assertEquals(l.State_Province__c,null);
	
	}
	static TestMethod void checkforCustomeFieldValues()
	{
		
		Lead l = new Lead();
		l.Phone = '2017657868';
		l.Email = 'test@gami.com';
		l.LastName = 'rancho';
		l.Company = 'xyz';
		l.Status = 'Open-Not Contacted';
		l.State_Province__c = 'Maharashtra';
		l.NumberofLocations__c = 'byt';
	    insert l;
	    System.assertEquals(l.State_Province__c,'Maharashtra');
	    System.assertEquals(l.NumberofLocations__c, 'byt');
	    
	
	
	}
    
    
	static TestMethod void checkforSame()
	{
		AreaZone__c a = new AreaZone__c();
        a.Name = 'a';
        a.AreaCode__c = '201';
        a.State_Province__c = 'Maharashtra';
        a.timeZone__c = 'EST';
        insert a;
        AreaZone__c b = new AreaZone__c();
        b.Name = 'a';
        b.AreaCode__c = '202';
        b.State_Province__c = 'rajsthan';
        b.timeZone__c = 'PST';
        insert b;
        
        Lead l = new Lead();
		l.phone = '2013456789';
		l.Email = 'test7@gmail.com';
		l.LastName = 'ranjklhd';
		l.Company = 'zenforce';
		l.LeadSource = 'Open-Not Contacted' ;
		insert l;
        
       
	    list<Lead> l2 = new list<Lead>();
	    l2 = [SELECT id,Phone,Email,NumberofLocations__c FROM LEAD WHERE id =: l.id];
	    System.assertEquals(l2[0].NumberofLocations__c,'EST');
	
	}
	static TestMethod void checkifStateNotChanged()
	{
		
		AreaZone__c a = new AreaZone__c();
        a.Name = 'a';
        a.AreaCode__c = '201';
        a.State_Province__c = 'Maharashtra';
        a.timeZone__c = 'EST';
        insert a;
        AreaZone__c b = new AreaZone__c();
        b.Name = 'a';
        b.AreaCode__c = '202';
        b.State_Province__c = 'rajsthan';
        b.timeZone__c = 'PST';
        insert b;
        Lead l = new Lead();
		l.phone = '2013456789';
		l.Email = 'test71@gmail.com';
		l.LastName = 'ranjklhd';
		l.Company = 'zenforce';
		l.LeadSource = 'Open-Not Contacted' ;
		
		  insert l;
		  l.Phone='2023456789';
		  update l;
		
        
      
        
		  List<Lead> led=new List<Lead>([select id,LastName,NumberofLocations__c from Lead where id=:l.id]);
		  System.debug('state Name'+led[0].NumberofLocations__c);
		  System.assertEquals(led[0].NumberofLocations__c,'PST');
	
	}
	
	static TestMethod void checkForUpdate()
	{
	    AreaZone__c a = new AreaZone__c();
        a.Name = 'a';
        a.AreaCode__c = '201';
        a.State_Province__c = 'Maharashtra';
        a.timeZone__c = 'EST';
        insert a;
        AreaZone__c b = new AreaZone__c();
        b.Name = 'a';
        b.AreaCode__c = '202';
        b.State_Province__c = 'rajsthan';
        b.timeZone__c = 'PST';
        insert b;
        
        Lead l = new Lead();
		l.phone = '2013456789';
		l.Email = 'test78@gmail.com';
		l.LastName = 'ranjklhd';
		l.Company = 'zenforce';
		l.LeadSource = 'Open-Not Contacted' ;
		
		  insert l;
		  l.Phone='3023456789';
		  update l;
        
		  ID leadId=l.Id;
		  List<Lead> led=new List<Lead>([select id,LastName,NumberofLocations__c from Lead where id=:leadId]);
		  System.debug('state Name'+led[0].NumberofLocations__c);
		  System.assertEquals(led[0].NumberofLocations__c,'EST');
		
	
	
	
	}
     static testMethod void SimpleInsert()
    {
         Lead l1 = new Lead(Phone = '1111111111', Email = 'test1@lead.com',LastName ='shivaji', Company ='project', leadSource = 'Closed - Converted');
    
         insert l1;
         
        
    }
    static testMethod void afterInsertCheck()
    {
        Lead l1 = new Lead(Phone = '1111111111', Email = 'test1@lead.com',LastName ='shivaji', Company ='project', Status = 'Open-Not Contacted');
    
        insert l1;
        
        list<Lead> l2 = new list<Lead>();
        
        l2 = [SELECT id,Status FROM LEAD];
        System.debug('this is your again output');
        System.debug(l2);
        System.assertEquals('Working - Contacted', l2[3].Status);
       // System.assertEquals('Working - Contacted',l2.Status);
        
     }
    static testMethod void afterInsertCheckAndCreateDup()
    {
        Lead l1 = new Lead(Phone = '12767896234', Email = 'test10@lead.com',LastName ='shivaji', Company ='project', Status = 'Open-Not Contacted');
    
        insert l1;
        
        list<Lead> l2 = new list<Lead>();
        l2 = [SELECT id,Status FROM LEAD];
        System.debug('this is your answer');
        System.debug(l2);
        System.assertEquals('Working - Contacted',l2[3].Status);
        l2[0].Status = 'Open-Not Contacted';
        update l2;
        
       
    }
    static testMethod void checkForDupliaction()
    {
        Lead l1 = new Lead(Phone = '1111111111', Email = 'test1@lead.com',LastName ='shivaji', Company ='project',Status = 'Open-Not Contacted');
    
        insert l1;
        Lead l2 = new Lead(Phone = '1111111111', Email = 'test1@lead.com',LastName ='shivaji', Company ='project', Status = 'Open-Not Contacted');
        
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
    static TestMethod void checkForTaskcreAtion()
    {
    
    	 Lead l6 = new Lead(Phone = '4444444879', Email = 'test14@lead.com',LastName ='shivaji', Company ='project', leadSource = 'Open-Not Contacted'); 
    	insert l6;
        
    }  
        
}