public with sharing class Attach {
	
	
	//private final BioBreifing__c bob;
	
	public static void method(List<BioBreifing__c> b)
	{
		String fileId = '';
        List<Attachment> attachedFile = [SELECT Id,Name,ContentType FROM Attachment where ParentId =: b[0].id Order By LastModifiedDate DESC  LIMIT 1];
        if(attachedFile != null && attachedFile.size() > 0)
        {
            fileId = attachedFile[0].Id;
            system.debug(fileId);
        }
        
      	b[0].Bio__c = '/servlet/servlet.FileDownload?file='+fileId; 
    }

}