trigger PruchaseHistoryTrigger on Purchase_History__c (after insert) {
    if (Trigger.isInsert) {
        PurchaseHistoryHandler.updateEngagementScore(Trigger.new);
    }
}

/*trigger PruchaseHistoryTrigger on Purchase_History__c (after insert) {
    Set<Id> accIdSet = new Set<Id>();    
    
    for (Purchase_History__c purhis : Trigger.new) {
        if (purhis.Account__c != null) {
            accIdSet.add(purhis.Account__c);
        }
    }
    List<Account> accountsToUpdate = new List<Account>();
    
    if (!accIdSet.isEmpty()) {
        List<Account> accountList = [ Select Id, Name,Engagement_Score__c from Account where Id IN:accIdSet];
        for(Purchase_History__c purhis : Trigger.new){
            for(Account acc : accountList){
                Decimal engagementScore = acc.Engagement_Score__c;
                if (!accountList.isEmpty() && purhis.Redeem_Points__c != true) {
                    acc.Engagement_Score__c = engagementScore + 5;
                    accountsToUpdate.add(acc);
                }
                if (!accountList.isEmpty() && purhis.Redeem_Points__c == true) {
                    acc.Engagement_Score__c = engagementScore + 7;
                    accountsToUpdate.add(acc);
                }
            }
        }
    }
    if (!accountsToUpdate.isEmpty()) {
        update accountsToUpdate;
    }
}

*/
// Step 1: Aggregate count of Purchase History per Account
/* Map<Id, Integer> accountPurchaseCountMap = new Map<Id, Integer>();

List<AggregateResult> results = [
SELECT Account__c AccountId, COUNT(Id) total
FROM Purchase_History__c
WHERE Account__c IN :accIdSet
GROUP BY Account__c
];*/

/*for (AggregateResult ar : results) {
Id accountId = (Id) ar.get('AccountId');
Integer totalCount = (Integer) ar.get('total');
accountPurchaseCountMap.put(accountId, totalCount);
}

// Step 2: Fetch Accounts and update their Engagement Score
List<Account> accountsToUpdate = new List<Account>();
for(Purchase_History__c purhis : Trigger.new){

for (Account acc : [SELECT Id, Engagement_Score__c FROM Account WHERE Id IN :accIdSet]) {
if (accountPurchaseCountMap.containsKey(acc.Id)&& purhis.Redeem_Points__c != true) {
Integer Score = accountPurchaseCountMap.get(acc.Id);
System.debug('Score'+Score);
acc.Engagement_Score__c = (Score *5);
//acc.Engagement_Score__c = accountPurchaseCountMap.get(acc.Id)*5;
System.debug('acc.Engagement_Score__c'+acc.Engagement_Score__c);
accountsToUpdate.add(acc);
}
if(accountPurchaseCountMap.containsKey(acc.Id) && purhis.Redeem_Points__c==true) {
Integer Score = accountPurchaseCountMap.get(acc.Id);
System.debug('Score'+Score);
acc.Engagement_Score__c = (Score *5) + 2;
System.debug('acc.Engagement_Score__c'+acc.Engagement_Score__c);
accountsToUpdate.add(acc);
}
}
}*/
// Step 3: Update accounts

//}
//}