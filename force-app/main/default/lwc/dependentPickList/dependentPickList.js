import { LightningElement , track } from 'lwc';

export default class DependentPickList extends LightningElement {
    selectedControlledField = '';
    selectedDependentField = '';

    controllingOptions = [{label:'Option A',value:'Option A'},{label:'Option B',value:'Option B'}];

    handleControllingField(event){
        this.selectedControlledField = event.target.value;
        if(this.selectedControlledField == 'Option A'){
            this.dependentOptions =[{label:'depend A',value:'depend A'},{label:'depend B',value:'depend B'}];

        }else if(this.selectedControlledField == 'Option B'){
            this.dependentOptions =[{label:'depend X',value:'depend X'},{label:'depend Y',value:'depend Y'}];

        }else{
           this.dependentOptions =[];
        }
    }
}