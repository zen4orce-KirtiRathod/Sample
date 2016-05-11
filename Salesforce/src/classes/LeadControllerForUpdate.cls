public class LeadControllerForUpdate {

    public LeadControllerForUpdate(ApexPages.StandardController controller) {

    }
    
    public Flow.Interview.SecondFlow leadFlow{get;set;}
    
    public String getLeadId()
    {
        if(leadFlow == null)
        {
            return '';
        }
        else
           return leadFlow.leadId;
        
    }


}