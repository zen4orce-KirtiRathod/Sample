public class campSecondController {
                Id id{get;set;}
        Campaign__c camp ;
        ApexPages.StandardController controller;
    public campSecondController(ApexPages.StandardController controller) {
        
        this.controller =controller;
        camp = (Campaign__c)controller.getRecord();
        id = camp.id;
        

    }
    public void getDeleted()
    {
        camp.Soft_Delete__c = true;
        update camp;
        
    }

}