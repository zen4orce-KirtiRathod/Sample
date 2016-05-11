@isTest
public class BioTest {
   public static testMethod void testBioBriefingExtensionByUploadingAttachement() {
	 	//INSERTING SAMPLE DATA
      	BioBreifing__c bObj = new BioBreifing__c();
		bObj.Name__c = 'APEX TEST CLASS';
		insert bObj;
		//INSERTING ATTACHEMENT
		Blob b = Blob.valueOf('Test Class Data');  
		Attachment attachment = new Attachment();  
		attachment.ParentId = bObj.id;  
		attachment.Name = 'Test Class Attachment for Parent';  
		attachment.Body = b;  
		insert(attachment);
		
		//CHECK FOR THE IMAGE URL IN OBJECT
        BioBreifing__c oldbObj = [Select Id,Biographic_image1__c,Bio__c,Name__c from BioBreifing__c where Id =: bObj.Id];
        System.assertEquals(oldbObj.Biographic_image1__c, '<img src="/servlet/servlet.FileDownload?file=" alt="Bio Image" height="20" width="20" border="0"/>');
        
		//CALLING CONTROLLER SAVE METHOD
        AttachmentUploadController controller = new AttachmentUploadController(new ApexPages.StandardController(bObj));
        controller.save();
        
        //FETCHING ATTACHEMENT LIST AND CHECK WHETHER UPDATED OR NOT
        List<Attachment> attachmentList = [SELECT Id,Name,ContentType FROM Attachment where ParentId =: bObj.Id Order By LastModifiedDate DESC  LIMIT 1];
        BioBreifing__c newbObj = [Select Id,Biographic_image1__c,Name__c from BioBreifing__c where Id =: bObj.Id];
        System.assertEquals(newbObj.Biographic_image1__c, '/servlet/servlet.FileDownload?file='+attachmentList[0].Id);
    }   
    public static testMethod void testBioBriefingExtensionWithoutUploadingAttachement() {
	 	//INSERTING SAMPLE DATA
      	BioBreifing__c bObj = new BioBreifing__c();
		bObj.Name__c = 'APEX TEST CLASS';
		insert bObj;
		
		//CHECK FOR THE IMAGE URL IN OBJECT
        BioBreifing__c oldbObj = [Select Id,Biographic_image1__c,Name__c from BioBreifing__c where Id =: bObj.Id];
        System.assertEquals(oldbObj.Biographic_image1__c, null);
        
		//CALLING CONTROLLER SAVE METHOD
        AttachmentUploadController controller = new AttachmentUploadController(new ApexPages.StandardController(bObj));
        controller.save();
        
        //FETCHING ATTACHEMENT LIST AND CHECK WHETHER UPDATED OR NOT
        List<Attachment> attachmentList = [SELECT Id,Name,ContentType FROM Attachment where ParentId =: bObj.Id Order By LastModifiedDate DESC  LIMIT 1];
        BioBreifing__c newbObj = [Select Id,Biographic_image1__c,Name__c from BioBreifing__c where Id =: bObj.Id];
        System.assertEquals(newbObj.Biographic_image1__c, null);
    }
}