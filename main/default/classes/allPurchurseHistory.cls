public class allPurchurseHistory {
 public Account accObj {get; set;}
 public DateTime currentDateTime{get; set;} 
 public List<Purchase_History__c>  purchaseList {get; set;}
     public allPurchurseHistory(ApexPages.standardController accCont){
        Id accId = accCont.getId();
        
        this.accObj = [SELECT Id,Name,BillingStreet,BillingCity,BillingState,BillingCountry,BillingPostalCode,PersonEmail,Business_Email__c,Type_of_Customer__c,LastModifiedById FROM Account where Id =:accId];
        this.currentDateTime = System.now();
        this.purchaseList =[Select Id,Name,List_Of_Products__c,Order_Amount__c,Loyalty_Points_Used__c,Redeem_Points__c,Total_Amount__c from Purchase_History__c where Account__c =:accId];
        
        }
}