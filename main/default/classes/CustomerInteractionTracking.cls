public class CustomerInteractionTracking {
    @AuraEnabled
    public static list<Purchase_History__c> getPurchaseList(id accid){
        list<Purchase_History__c> purchList=[SELECT Name,List_Of_Products__c, Total_Items__c, Order_Amount__c, Loyalty_Points_Earned__c, Total_Amount__c, Loyalty_Points_Used__c, CreatedDate FROM Purchase_History__c where Account__c=:accid order by CreatedDate Desc limit 3];
     return purchList;
    }
    
    @AuraEnabled
    public static list<Engagement_Activity__c> getEngList(id accid){
        list<Engagement_Activity__c> engList=[SELECT Name,Medium__c,CreatedDate FROM Engagement_Activity__c where Account__c=:accid order by CreatedDate Desc limit 3];
     return engList;
    }
    
    @AuraEnabled
    public static list<Loyalty_Program__c> getLoyaltyList(id accid){
        list<Loyalty_Program__c> loyaltyList=[SELECT Name,Loyalty_Points_Earned__c,	Points_Balance__c,Points_Used__c,Program_Status__c,Expiry_Date__c FROM Loyalty_Program__c where Account__c=:accid order by CreatedDate Desc limit 3];
     return loyaltyList;
    }

}