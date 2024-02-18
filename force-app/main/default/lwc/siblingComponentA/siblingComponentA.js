import { LightningElement } from 'lwc';

export default class SiblingComponentA extends LightningElement {
    enteredData = '';
    handleChange(event){
          this.enteredData = event.target.value;
          const cusevent = new CustomEvent('datachange',{detail:this.enteredData});
          this.dispatchEvent(cusevent);
    }
}