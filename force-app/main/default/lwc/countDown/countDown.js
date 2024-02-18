import { LightningElement ,track} from 'lwc';
const TIMER_DURATION = 10;
export default class CountDown extends LightningElement {
    // initial timer value
    timerValue = TIMER_DURATION;
    timerInterval;
    startTimer(){
        clearInterval(this.timerInterval);
       
        this.timerInterval = setInterval(() =>{
            // decrement timer value
            this.timerValue--;
            //check if timer reaches 0
            if(this.timerValue <= 0){
                clearInterval(this.timerInterval)
                this.showAlert();
            }
            //update each second
        },1000)
    }

    showAlert(){
        alert(`Time's Up!`)
    }
}