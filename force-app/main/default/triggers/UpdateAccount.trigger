trigger UpdateAccount on Opportunity (after insert , after update) {
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        Set<Id> accIds = new Set<Id>();
        for(Opportunity op : trigger.new){
            if(op.AccountId != null){
              accIds.add(op.AccountId);  
            }            
        }
        List<Account> accToUpdate = [Select Total_opportunities__c,Total_Amount__c,(Select Id,Amount from opportunities) from Account Where Id IN :accIds];
        for(Account acc:accToUpdate){
            acc.Total_opportunities__c = acc.opportunities.size();
            decimal totalAmount = 0;
            for(Opportunity o:acc.opportunities){
                totalAmount = totalAmount + o.Amount;
            }
            acc.Total_Amount__c = totalAmount;
            
        }
        update accToUpdate;
    }

}