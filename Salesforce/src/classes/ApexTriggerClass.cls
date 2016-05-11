public class ApexTriggerClass {

    public TriggerSetting__c trig{get;set;} 
   
   
   
    
    
   
    public ApexTriggerClass(ApexPages.StandardController controller) {
    
        this.trig = (TriggerSetting__c )Controller.getRecord();

    
    }
     
    public Pagereference Save()
    {
        system.debug('hello');
        list<ApexTrigger> ap = new list<ApexTrigger>([SELECT Name,Status FROM ApexTrigger WHERE Name = : trig.name ]);
        system.debug(ap);
    return null;
    }
    
    public void invokeTrig()
    {
    
        
        /*if(trig.Disable_Trigger__c == true )
        {
                
            
            ap. = 'Active';
           
             update ap;
        
        }*/
             
    
    
    }

}