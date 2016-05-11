trigger OpportunityEmailTemplateTrig on Opportunity (after insert, after update) {
    
    if(trigger.isAfter)
    {
        if(trigger.isInsert)
        {
   		 	HandlerForOpportunityEmailTemplate.afterInsert(Trigger.new);
        }
        else 
        {
            HandlerForOpportunityEmailTemplate.afterUpdate(trigger.oldMap, trigger.new);
        }
    
    }

}