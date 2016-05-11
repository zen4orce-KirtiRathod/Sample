public class CampaignController {
	 Id id{get;set;}
    Campaign__c camp ;
    private ApexPages.StandardSetController controller;
    public CampaignController(ApexPages.StandardSetController controller) {
       this.controller = controller;
        camp = (Campaign__c)controller.getRecord();
        id = camp.id; 
    }
    
    

}