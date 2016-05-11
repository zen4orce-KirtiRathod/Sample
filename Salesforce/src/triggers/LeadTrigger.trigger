trigger LeadTrigger on Lead (before insert,before Update,After insert,After update) {
    
   if(Trigger.isbefore)
    {
       
        if(Trigger.isInsert)
        {
                       HandlerForLead.beforeinsert(Trigger.new);
            		   HandlerForLeadDuplicate.beforeInsert(Trigger.new,Trigger.old);
            
        }
       else if(Trigger.isUpdate)
       {
           HandlerForLead.beforeUpdate(Trigger.new , trigger.oldMap);
           HandlerForLeadDuplicate.beforeUpdate(Trigger.New,Trigger.oldMap);
       
       }
   
    }
    if(Trigger.isAfter)
        {
            if(Trigger.isInsert)
            {
                 HandlerForLeadDuplicate.afterInsert(Trigger.new);    
                HandlerForLeadStatus.afterInsert(trigger.new);
                   
            }      
            else if(Trigger.isUpdate)
            {
                
                HandlerForLeadStatus.afterUpdate(trigger.oldMap,trigger.new);
            }         
        }
}