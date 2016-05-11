global  class OppoSumBatch  implements Database.Batchable<sObject>,Database.Stateful{
    
    global Decimal sum = 0;
    global integer totalOpp = 0;
    global datetime startDate;
    global datetime endDate;
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        startDate = system.now();
        return Database.getQueryLocator(
        	'Select id,CloseDate,Amount,StageName from opportunity where StageName= \'Closed Won\' and CreatedDate=TODAY');
    }
    
    global void execute(Database.BatchableContext bc,list<Opportunity> op)
    {
        list<Opportunity> updatedList = new list<Opportunity>();
      
        for(Opportunity p : op)
        {
            sum = sum+ p.Amount;
            p.IsAggregated__c = true;
            updatedList.add(p);
           
        }
        system.debug(sum);
        update updatedList;  
        
    }
   global void finish(Database.BatchableContext bc)
   {
       endDate = system.now();
       Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
       profile sys = [select id from profile where name='System Administrator'];
       
       Id idNew = sys.id;
       list<USER> SystemUser = new list<User>([SELECT id,Email From User WHERE  ProfileId =: idNew]);
       
       email.setToAddresses(new String[] { SystemUser[0].Email});
       email.setSubject('Daily Opportunity Amount Aggregator Job Complete');
       email.setPlainTextBody('The batch job for Daily Opportunity Amount Aggregation has completed successfully. The details associated with the job are as follows:'+
					'Start DateTime                 	   : '+ startDate+
					'End DateTime                   	   : '+ endDate+
			'Total Duration (in Hours)		           : '+((endDate.hour()) - (startDate.hour()))+
		'Number of Opportunities Closed Won Today 	   : '+ totalOpp +
			'Total Opportunity Amount for today	       : '+ sum);

       Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
       
       
       
                            
   }
	}