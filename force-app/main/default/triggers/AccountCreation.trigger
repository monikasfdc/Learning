trigger AccountCreation on Contact (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        if(RecursiveTriggerHandler.flag){
            RecursiveTriggerHandler.flag = false;
        List<Account> acclist = new List<Account>();
        for(Contact c : trigger.new){
            Account a = new Account();
            a.Name = c.LastName + 'acc';
            a.Phone = c.Phone;
            acclist.add(a);
        }
        insert acclist;
        }
    }

}