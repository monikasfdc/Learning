import { LightningElement } from 'lwc';

export default class DynamicForm extends LightningElement {
    formTypeOptions = [
        {label:'Email',value:'Email'},
        {label:'Name',value:'Name'},
    ]
    selectedType = '';
    showEmail = false;
    showName = false;
    handleChange(event){
        this.selectedType = event.target.value;
        this.showEmail = this.selectedType === 'Email' ;
        this.showName = this.selectedType === 'Name' ;
    }
}