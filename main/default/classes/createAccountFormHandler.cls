public class createAccountFormHandler {
 @AuraEnabled
    public static void createAccount(Account accObj) {
        insert accObj;
       
    }

    @AuraEnabled
    public static List<Account> getAccountList() {
        List<Account> accList = [SELECT Id, Name, AccountNumber, AnnualRevenue FROM Account];
        return accList;
    }
}