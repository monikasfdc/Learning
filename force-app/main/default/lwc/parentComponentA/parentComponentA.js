import { LightningElement } from 'lwc';

export default class ParentComponentA extends LightningElement {
    sharedData = '';
    handlechange(event){
       this.sharedData = event.detail;
    }
}