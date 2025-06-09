public class AccountBatch implements DataBase.batchable<SObject> {
    
    public DataBase.QueryLocator start(DataBase.BatchableContext bc)
    {
       return database.getQueryLocator('select id,rating from Account');
        
    }
    public void execute(DataBase.BatchableContext bc,list<Account> acclist)
    {
        for(Account a: accList)
        {
            if(a.Rating==NULL)
                a.Rating='Hot';
        }
        update accList;
    }

    public void finish(DataBase.BatchableContext bc)
    {
        system.debug('all records are processed  ... I am Finished Method');
    }
}