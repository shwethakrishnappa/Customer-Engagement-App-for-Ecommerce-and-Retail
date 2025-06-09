@isTest
public class EngagementActivityTest {

    @isTest
    static void testEngagementScoreUpdate() {
        // Insert Accounts
        Account acc1 = new Account(Name = 'Account 1',recordTypeId='012gK0000008wZtQAI', Business_Email__c='vijaya.sirisha5@gmail.com',Engagement_Score__c = 10,Customer_Segment__c ='Existing Customers');
       // Account acc2 = new Account(Name = 'Account 2');
        list<Account> a=new list<Account>();
        a.add(acc1);
        //a.add(acc2);
        insert a;
 
        // Insert Purchase History records
        List<Engagement_Activity__c> engagementactrec = new List<Engagement_Activity__c>{
            //new Purchase_History__c(Account__c = acc1.Id, Redeem_Points__c = true),  // +7
            new Engagement_Activity__c(Account__c = acc1.Id,Target_Audience__c ='Existing Customers',Medium__c ='Email',Engagement_Notes__c ='abc') // +5
            //new Purchase_History__c(Account__c = acc2.Id, Redeem_Points__c = false)  // +5
        };

        Test.startTest();
        insert engagementactrec;
        Test.stopTest();

        // Verify updated Engagement Scores
        Account updatedAcc1 = [SELECT Engagement_Score__c FROM Account WHERE Id = :acc1.Id];
        System.debug('updatedAcc1'+updatedAcc1.Engagement_Score__c);
        //Account updatedAcc2 = [SELECT Engagement_Score__c FROM Account WHERE Id = :acc2.Id];

        System.assertEquals(12, updatedAcc1.Engagement_Score__c, 'Acc1 Score should be 15');
        //System.assertEquals(5, updatedAcc2.Engagement_Score__c, 'Acc2 Score should be 5');
    }
}