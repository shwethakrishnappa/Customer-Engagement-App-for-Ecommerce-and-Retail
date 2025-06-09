public class engagementActivityHandler
{
    public static void updateEngagementScore(List<Engagement_Activity__c> newRecords) 
    {
        Set<Id> accIdSet = new Set<Id>();    
        for (Engagement_Activity__c engagementactrec : newRecords)
        {
            if (engagementactrec.Account__c != null) 
            {
                accIdSet.add(engagementactrec.Account__c);
            }
        }
        List<Account> accList = [Select Id,Engagement_Score__c from Account where Id IN: accIdSet];
        List<Account> accountsToUpdate = new List<Account>();
        if(!accList.isEmpty())
        {
            for(Account accLists : accList)
            {
                Decimal engagementscore = accLists.Engagement_Score__c != null ? accLists.Engagement_Score__c : 0;
                accLists.Engagement_Score__c = engagementscore + 2; 
                accountsToUpdate.add(accLists);
            }
            
            if (!accountsToUpdate.isEmpty())
            {
                update accountsToUpdate;
            }
        }
    }
}