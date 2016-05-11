public class ContactSearch {
	
	public static list<Contact> searchForContacts(String a,String b)
	{
		list<Contact> con = new list<Contact>();
		
		Contact c = [Select c.Name, c.Id From Contact c WHERE c.LastName =: a  AND c.MailingPostalCode =: b];
		con.add(c);
		return con;
	}

}