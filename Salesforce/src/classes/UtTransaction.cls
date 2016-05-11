public with sharing class UtTransaction {
        private final  UT_Transaction__c u;
        private ApexPages.StandardController controller;
        private final string ide ;
        public  string flag{get;set;} 
        public string var{get;set;}
        public UtTransaction(ApexPages.StandardController controller)
        {
            this.controller = controller;
            this.u = (UT_Transaction__c)controller.getRecord();
            system.debug('In Constructor');
            ide = u.Id;
        
        }
        public PageReference Save()
        {
           
           
            insert u;
             
            var = null;
            PageReference pr;
            
                        UT_Fund__c fund = new  UT_Fund__c();
                        string num = u.UT_Fund_Name__c;
                       If(num != null)
                       {
                         fund = [SELECT  id,Name,Cut_off_Time__c,Currency1__c FROM UT_Fund__c WHERE id =: num];
                         u.Currency__c = fund.Currency1__c;
                         update u;
                         if(fund.Cut_off_Time__c < System.today())
                         {
                             flag = 'true';
                            
                         }
                         else
                         {
                            
                            flag = 'false';
                         }
                       }
             var = u.Transaction_Type__c;
            
            if(var != 'Purchase' || var != 'Redemption' && var != null)
            {
                pr = new PageReference('apex/TransactiontypeForNormal');
                
            }
            
            
                        pr = New PageReference('/apex/ut');
                        
                       
                        pr.getParameters().put('str',var);
                        pr.getParameters().put('flag',flag);                    
                        pr.setRedirect(true);
                        
                      
            system.debug(pr);
          
            
            return pr;          
            
        }
       
          
          
                
        }