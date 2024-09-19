import { LightningElement } from 'lwc';

export default class Augmentor extends LightningElement {
    startCounter = 0;

    handleMaximizeCounter() {
        this.template.querySelector('c-numerator').maximizeCounter();
    }

    handleStartChange(event) {
        this.startCounter = parseInt(event.target.value);
    }
}