public class MapForAccount1 {
    
    public void mapAcc()
    {
        Map<Id,user> user1 = new Map<Id,user>([SELECT id,Name from user where isactive= true]);
       // user1 = [SELECT id,Name from User Where IsActive = true ];
       // 
       system.debug(user1);
        system.debug(user1.get('00528000001OjcuAAC'));
    }

}