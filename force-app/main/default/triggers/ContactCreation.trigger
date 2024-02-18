trigger ContactCreation on Account (after insert,before insert,before update,before delete) {
    if(Trigger.isAfter && Trigger.isInsert){
        List<Contact> conList = new List<Contact>();
        for(Account a :trigger.new){
            if(a.Id != null){
              Contact c = new Contact();
            c.LastName = a.Name;
            c.AccountId = a.Id;
            c.Phone = a.Phone;
            conList.add(c);   
            }
           
        }
        insert conList;
    }
    //prevent duplicate
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){        
        for(Account a:trigger.new){
            Integer recordCnt = [select count() from Account where Name = :a.Name];
            if(recordCnt > 0){
                a.addError('Account name should be unique');
            }
        }
       
    }
    
    //associated acc id in contact make that as null
    if(Trigger.isBefore && Trigger.isDelete){
        List<Contact> conlist = [select Id,AccountId from Contact where AccountId IN : Trigger.oldMap.keyset()];
        if(!conlist.isEmpty()){
            for(Contact c:conlist){
                c.AccountId = null;
            }
        }
        update conlist;
    }

}