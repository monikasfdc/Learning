import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class DynamicFormCreation extends LightningElement {
    enteredName = '';
    handleChange(event){
     this.enteredName = event.detail.value;
    }

    handleSubmit(){
        if(this.enteredName){
            this.handleSuccess();
        } else {
            this.handleError('Please Enter a Name');
        }
    }

    handleSuccess(){
        const event =new ShowToastEvent({
            title : 'Success',
            message:'Record created',
            variant: 'success'
        });
        this.dispatchEvent(event);
    }

    handleError(error){
        const event = new ShowToastEvent({
            title : 'Error',
            message: error,
            variant: 'error'
        });
        this.dispatchEvent(event);
    }
    
}