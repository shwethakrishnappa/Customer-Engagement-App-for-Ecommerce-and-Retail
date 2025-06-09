@isTest
public class PurchaseHistoryHandlerTest {

    @isTest
    static void testEngagementScoreUpdate() {
        // Insert Accounts
        Account acc1 = new Account(Name = 'Account 1',recordTypeId='012gK0000008wZtQAI', Business_Email__c='vijaya.sirisha5@gmail.com',Engagement_Score__c = 10);
       // Account acc2 = new Account(Name = 'Account 2');
        list<Account> a=new list<Account>();
        a.add(acc1);
        //a.add(acc2);
        insert a;
 
        // Insert Purchase History records
        List<Purchase_History__c> purchases = new List<Purchase_History__c>{
            //new Purchase_History__c(Account__c = acc1.Id, Redeem_Points__c = true),  // +7
            new Purchase_History__c(Account__c = acc1.Id,List_Of_Products__c='Dress',Payment_Method__c='Cash',Order_Amount__c=5000,Redeem_Points__c = false) // +5
            //new Purchase_History__c(Account__c = acc2.Id, Redeem_Points__c = false)  // +5
        };

        Test.startTest();
        insert purchases;
        Test.stopTest();

        // Verify updated Engagement Scores
        Account updatedAcc1 = [SELECT Engagement_Score__c FROM Account WHERE Id = :acc1.Id];
        //Account updatedAcc2 = [SELECT Engagement_Score__c FROM Account WHERE Id = :acc2.Id];

        System.assertEquals(13, updatedAcc1.Engagement_Score__c, 'Acc1 Score should be 15');
        //System.assertEquals(5, updatedAcc2.Engagement_Score__c, 'Acc2 Score should be 5');
    }
}