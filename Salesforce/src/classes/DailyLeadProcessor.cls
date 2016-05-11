global class DailyLeadProcessor implements Schedulable {
    
    global void execute(SchedulableContext ctx)
    {
        
        list<Lead> leadList = new list<Lead>([SELECT ID ,LeadSource FROM Lead LIMIT 200]);
        for(Lead l: leadList)
        {
            l.LeadSource = 'Dreamforce';
            
            
        }
        update leadList;
        
        
    }
  
}