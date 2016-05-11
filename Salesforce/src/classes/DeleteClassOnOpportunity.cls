public class DeleteClassOnOpportunity {
    
    @InvocableMethod(label='Delete Opportunity'  description = 'Delete a record')
    	public static void deleteOpp(List<Id> Opportunity)
        {
            
            List<Opportunity> opp = [SELECT Id From Opportunity Where Delete_a_Record__c = true];
            Delete opp;
            
        }

}