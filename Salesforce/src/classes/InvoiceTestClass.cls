@isTest
private class InvoiceTestClass {
    
   public static testMethod void testforSearchButton()
    {
        list<Project1__c> pr = new list<Project1__c>();
        list<Time_Entry__c>te = new list<Time_Entry__c>();
        list<Project1__c> prlist = new list<Project1__c>();
        for(integer i = 7;i < 10 ;i++) 
            {
               Project1__c p = new Project1__c();
               p.Name = 'Project'+ i;
               p.Account_Name__c = '0012800000TWpjc';
               pr.add(p);
               
                
            }
        insert pr;
        for(integer i = 7 ; i< 9;i++)
        {
            Time_Entry__c t = new Time_Entry__c();
            t.Project__c = pr[0].id;
            t.Description__c = 'test1';
            t.Contact__c = '0032800000EY6YL';
            t.Duration__c = 45;
            t.Time_Entry_Hours__c = 67;
            te.add(t);
            
        }
        for(integer i = 9 ; i< 11;i++)
        {
            Time_Entry__c t = new Time_Entry__c();
            t.Project__c = pr[1].id;
            t.Contact__c = '0032800000EY6YL';
            t.Description__c = 'test2';
            t.Duration__c = 56;
            t.Time_Entry_Hours__c = 78;
            te.add(t);
            
        }
        insert te;
        Invoice1__c inv = new Invoice1__c();
        inv.Account__c = '0012800000TWpjc';
        
        WrapperController controller  = new WrapperController(new ApexPages.StandardController(inv));
        controller.Search();
        System.assertEquals(3,controller.wrapperProjectList.size() );
        system.debug(controller.wrapperProjectList);
        controller.wrapperProjectList[0].isSelected = true;
        controller.wrapperProjectList[1].isSelected = true;
        controller.GenerateInvoice();
        controller.getwrapperProjectList();
        list<Invoice1__c> generatedInvoice = new list<Invoice1__c>();
        generatedInvoice = [SELECT id,Account__c,Project_Name__c FROM Invoice1__c  WHERE Account__c =:  inv.Account__c ];
        System.assertEquals(2,generatedInvoice.size() );
        System.debug(generatedInvoice);
        integer count;
       
        list<Time_Entry__c> iline = new list<Time_Entry__c>([select id,Project__c FROM Time_Entry__c WHERE   Project__c = :generatedInvoice[0].Project_Name__c ]);
       	system.debug(iline);
        count = iline.size();
        system.debug(count);
     
       list<Invoice_Line_Item__c> intro = new list<Invoice_Line_Item__c>([select id,Invoice1__c FROM Invoice_Line_Item__c WHERE Invoice1__c =:generatedInvoice[0].id  ]);
        //System.assertNotEquals(count, intro.size());
       system.assertEquals(count,intro.size());
      
   }
    
    
    

}