public class PurchaseHistoryHandler {
    public static void updateEngagementScore(List<Purchase_History__c> newRecords) {
        Set<Id> accIdSet = new Set<Id>();
        Map<Id, Decimal> accIdToScoreMap = new Map<Id, Decimal>();

        for (Purchase_History__c purhis : newRecords) {
            if (purhis.Account__c != null) {
                accIdSet.add(purhis.Account__c);
                Decimal scoreToAdd = purhis.Redeem_Points__c ? 5 : 3;

                if (accIdToScoreMap.containsKey(purhis.Account__c)) {
                    accIdToScoreMap.put(purhis.Account__c, accIdToScoreMap.get(purhis.Account__c) + scoreToAdd);
                } else {
                    accIdToScoreMap.put(purhis.Account__c, scoreToAdd);
                }
            }
        }

        if (!accIdSet.isEmpty()) {
            List<Account> accountsToUpdate = new List<Account>();
            List<Account> accountList = [
                SELECT Id, Engagement_Score__c
                FROM Account
                WHERE Id IN :accIdSet
            ];

            for (Account acc : accountList) {
                Decimal existingScore = acc.Engagement_Score__c != null ? acc.Engagement_Score__c : 0;
                if (accIdToScoreMap.containsKey(acc.Id)) {
                    acc.Engagement_Score__c = existingScore + accIdToScoreMap.get(acc.Id);
                    accountsToUpdate.add(acc);
                }
            }

            if (!accountsToUpdate.isEmpty()) {
                update accountsToUpdate;
            }
        }
    }
}