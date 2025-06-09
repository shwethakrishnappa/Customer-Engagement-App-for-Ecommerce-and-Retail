public without sharing class SampleBatch {

    @AuraEnabled
    public static void callAccountBatch()
    {
        AccountBatch ac=new AccountBatch();
		database.executebatch(ac,50);
        //return jobid;
    }
}