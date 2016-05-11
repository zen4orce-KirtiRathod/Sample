global class LeadProcessor implements Database.Batchable<sObject>,Database.Stateful {
    
    global Integer recordsProcessed = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('SELECT ID ,LeadSource FROM Lead LIMIT 200');
        
        
    }
	global void execute(Database.BatchableContext bc,List<Lead> leadList)
    {
       
        for(Lead l: leadList)
        {
            l.LeadSource = 'Dreamforce';
            
            
        }
        update leadList;
        
    }
	global void finish(Database.BatchableContext bc)
    {
        
    }
	    
    
    

}