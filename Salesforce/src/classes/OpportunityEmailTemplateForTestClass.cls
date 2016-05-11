public  class OpportunityEmailTemplateForTestClass {
	
	static TestMethod void afterInsert()
	{
		Opportunity opp = new Opportunity(Name = 'Kirti', CloseDate = System.today(), StageName = 'Prospecting',Amount = 5000000.0);
		
		insert opp;
	
	}
	static TestMethod void afterInsertnotGreater()
	{
	
		Opportunity opp = new Opportunity(Name = 'Kirtihk', CloseDate = System.today(), StageName = 'Prospecting',Amount = 5000);
		
		insert opp;
	
	}
	static TestMethod void afterUpdate()
	{
	
		Opportunity opp = new Opportunity(Name = 'Kirtihk', CloseDate = System.today(), StageName = 'Prospecting',Amount = 5000);
		
		insert opp;
	    ID l = opp.id;
	    list<Opportunity> op = new list<Opportunity>([SELECT id,Amount FROM Opportunity WHERE id =: l]);
	    
	    op[0].Amount = 7000000;
	    update op;
	    
	
	}

}