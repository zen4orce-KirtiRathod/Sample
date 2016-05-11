@isTest


public  class testClassForHandlerForLead {
	static testMethod void CountContactOfAccountUnitTest() {
	
	Lead l = new Lead(Phone ='2017687687',Company  = 'Kunta' ,LastName ='Jain');
//	System.debug('Value of lead Object');
	System.debug('Phone Number:'+l.Phone +'TimeZone :'+l.NumberofLocations__c+'State:'+l.State_Province__c+'Company :'+l.Company+'LastName:'+l.LastName );
	insert l;
	l = [SELECT Phone,NumberofLocations__c,Company,State_Province__c,LastName FROM Lead  WHERE  Id =:l.Id];
	System.debug('Phone Number:'+l.Phone +'TimeZone :'+l.NumberofLocations__c+'State:'+l.State_Province__c+'Company :'+l.Company+'LastName:'+l.LastName );
	}
	
}