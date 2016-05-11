public with sharing class SecondPage {
	
	private final UT_Transaction__c ut;
	
	//UtTransaction u = new UtTransaction();
	//this.ut.id = u.getId();
	
	
	public SecondPage(ApexPages.StandardController stdController)
	{
		
	 //this.ut =  (UT_Transaction__c)stdController.getRecord();
	// this.ut = u.getAllRecord();
	 ut.Transaction_Type__c = 'Redemption(Switch out)';
     upsert ut;
	
	}
	

}