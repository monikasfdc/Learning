import { LightningElement ,wire} from 'lwc';
import { getListUi } from 'lightning/uiListApi';
import Account_Object from '@salesforce/schema/Account';
export default class AccountList extends LightningElement {
    accountList =[];
    @wire(getListUi,{objectApiName:Account_Object,listViewApiName:'AllAccounts'})
    getAllAccounts({data,error}){
        if(error){
        this.err = error;
        }
        if(data){
         
          this.accountList = data.records.records
          console.log(this.accountList);;
        }
    }

}