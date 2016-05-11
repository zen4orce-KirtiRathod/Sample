public with sharing class ContactAndLeadSearch {
	
	public static List<List<SObject>> searchContactsAndLeads(string a)
	{
		List<List<SObject>> searchList = [FIND :a IN NAME FIELDS RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName) ];
		//Contact[] searchContact = (Contact[])searchList[0];
		//Lead[] searchLead = (Lead[])searchList[1];
		
		return searchList;
	
	}

}