public class se {

    
	public string  cronExp;
    public string selectedSeconds { get; set;}
    public string selectedMinutes{get;set;}
    public string selectedHours{get;set;}
    public string selectedDayOfMonth{get;set;}
    public string selectedMonth{get;set;}
    public string selectedWeekDays{get;set;}
    public string selectedYear{get;set;}
    list<Selectoption> seconds = new list<Selectoption>();
    list<selectoption> minutes = new list<selectOption>();
    list<selectoption> hours = new list<selectOption>();
    list<selectoption> dayOfMonth = new list<selectoption>();
    list<selectoption> month = new list<selectoption>();
    list<selectoption> weekDays = new list<selectoption>();
    list<selectoption> year = new list<selectoption>();
    public se() {
        

    }
    public list<selectOption> getSeconds()
    {
      
       for(integer i =0 ;i<59;i++)
       {
           seconds.add(new Selectoption(string.valueOf(i),String.valueOf(i)));
       }
       return seconds; 
    }
    public list<selectOption> getMinutes()
   	{
        for(integer i =0;i<60;i++)
        	{
            	minutes.add(new selectOption(string.valueOf(i),string.valueOf(i)));
        	}
       return minutes;
    }
   public list<selectOption> getHours()
   {
       
       for(integer i =0;i<24;i++)
       {
           hours.add(new selectoption(string.valueOf(i),string.valueOf(i)));
       }
       return hours;
   }
   public list<selectoption> getDayOfMonth()
   {
      
       for(integer i = 1;i<32;i++ )
       {
           dayOfMonth.add(new selectoption(string.valueOf(i),string.valueOf(i)));
       }
       return dayOfMonth;
   }
    public list<selectoption> getMonth()
    {
       		
             month.add(new selectoption('1','Jan'));
             month.add(new selectoption('2','Feb'));
             month.add(new selectoption('3','Mar'));
             month.add(new selectoption('4','Apr'));
             month.add(new selectoption('5','May'));
             month.add(new selectoption('6','Jun'));
             month.add(new selectoption('7','Jul')); 
             month.add(new selectoption('8','Aug'));
             month.add(new selectoption('9','Sept'));
             month.add(new selectoption('10','Oct'));
             month.add(new selectoption('11','Nov'));
             month.add(new selectoption('12','Dec'));
                         
        
        return month;
    }
    public list<selectoption> getWeekDays()
    {
       
        
        
        weekDays.add(new selectoption('SUN','SUN'));
        weekDays.add(new selectoption('MON','MON'));
        weekDays.add(new selectoption('TUE','TUE'));
        weekDays.add(new selectoption('WED','WED'));
        weekDays.add(new selectoption('THU','THU'));
        weekDays.add(new selectoption('FRI','FRI'));
        weekDays.add(new selectoption('SAT','SAT'));
        
     return weekDays;
   }
   public list<selectoption> getYear()
   {
       for(integer i = 1997 ;i<2017;i++)
       {
                year.add(new selectoption(string.valueOf(i),string.valueOf(i)));
       }
       
       return year;
   }
   public void msg()
   {
        
       
        
       
       if(selectedDayOfMonth !=null )
       {
			 selectedWeekDays = '?';
			
			
       }
		 cronExp = selectedSeconds+' '+selectedMinutes+' '+ selectedHours+' '+selectedDayOfMonth+' '+selectedMonth+' '+selectedWeekDays+' '+selectedYear;
  		 ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.INFO,cronExp));
       		
	  }	
      public void schedual() {
       if(selectedDayOfMonth !=null )
       {
			 selectedWeekDays = '?';
			
       }
     	cronExp = selectedSeconds+' '+selectedMinutes+' '+ selectedHours+' '+selectedDayOfMonth+' '+selectedMonth+' '+selectedWeekDays+' '+selectedYear;
 		SchedualOpp sc = new SchedualOpp(); 
     }
 }