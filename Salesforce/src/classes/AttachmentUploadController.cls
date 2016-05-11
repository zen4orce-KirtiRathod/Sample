public class AttachmentUploadController{
	
	private final BioBreifing__c bob  ;
//	BioBreifing__c b = new BioBreifing__c(); 
	
    
    
   // public Id recId{get;set;}
   
    
    
    	public AttachmentUploadController(ApexPages.StandardController controller)
   		 {   
       		this.bob = (BioBreifing__c)controller.getRecord();
             system.debug('in constructor');
             system.debug(bob.Id);
    	}
    	
    	//upsert bob;
    
    
    
    
    public PageReference Save()
    {
    	
    	String fileId = '';
        List<Attachment> attachedFile = [SELECT Id,Name,ContentType FROM Attachment where ParentId =: bob.id Order By LastModifiedDate DESC  LIMIT 1];
        system.debug(attachedFile);
        if(attachedFile != null && attachedFile.size() > 0)
        {
            fileId = attachedFile[0].Id;
            system.debug(fileId);
            system.debug('in fileid');
        }
        system.debug('In save page');
        bob.Bio__c = '/servlet/servlet.FileDownload?file='+fileId;
    	upsert bob;
    	return  new ApexPages.StandardController(bob).view();
    	
    }
   
    
}