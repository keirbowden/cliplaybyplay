import { LightningElement, api } from 'lwc';

export default class ExpenseItem extends LightningElement {
    @api
    date;

    @api
    amount;

    @api
    description;

    @api
    index;

    handleDateChange(event) {
        let date=event.target.value;
        // eslint-disable-next-line no-console
        console.log('Item with index ' + this.index + ' Date Changed');
        this.dispatchEvent(new CustomEvent('datechanged', { detail : {index: this.index, value: date}}));
    }

    handleDescriptionChange(event) {
        let description=event.target.value;
        // eslint-disable-next-line no-console
        console.log('Item with index ' + this.index + ' Description Changed');
        this.dispatchEvent(new CustomEvent('descriptionchanged', { detail : {index: this.index, value: description}}));
    }

    handleAmountChange(event) {
        let amount=event.target.value;
        // eslint-disable-next-line no-console
        console.log('Item with index ' + this.index + ' Amount Changed');
        this.dispatchEvent(new CustomEvent('amountchanged', { detail : {index: this.index, value: amount}}));
    }
}