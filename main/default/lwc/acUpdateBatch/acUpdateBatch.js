import callAccountBatch from '@salesforce/apex/SampleBatch.callAccountBatch';
import { LightningElement } from 'lwc';


export default class AcUpdateBatch extends LightningElement {

handleClick()
{
    callAccountBatch().then(()=>
    {
        alert('Batch Job started Suessfully');

    }).catch(error=>{
        console.error('Error starting Batch:',error);
    });
}

}