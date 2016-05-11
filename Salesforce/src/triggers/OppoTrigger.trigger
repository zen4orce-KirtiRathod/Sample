trigger OppoTrigger on Opportunity (after insert,after update) {
    
    if(Trigger.isafter)
    {
                    OpportunityChatter.Opp(Trigger.new);
         
    }
    
}