import { LightningElement, track } from 'lwc';
import CreateExpenseReport from '@salesforce/apex/ExpenseReportController.CreateExpenseReport';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ExpenseReport extends LightningElement {
    @track
    report={};

    idx=1;

    @track
    outRep={};

    @track
    items=[];

    constructor() {
        super();
        this.items.push({index: this.idx++});
    }

    handleNameChange(event) {
        this.report.Name=event.target.value;
        // eslint-disable-next-line no-console
        console.log('Name now = ' + this.report.Name);
    }

    handleStartDateChange(event) {
        this.report.SFDXPBP__Start_Date__c=event.target.value;
        // eslint-disable-next-line no-console
        console.log('Start Date now = ' + this.report.SFDXPBP__Start_Date__c);
    }

    handleEndDateChange(event) {
        this.report.SFDXPBP__End_Date__c=event.target.value;
        // eslint-disable-next-line no-console
        console.log('End Date now = ' + this.report.SFDXPBP__End_Date__c);
    }

    findItem(index) {
        let item=null;

        // eslint-disable-next-line no-console
        console.log('Item Index = ' + index);
        for (let idx=0; idx<this.items.length; idx++) {
            let cand=this.items[idx];
            // eslint-disable-next-line no-console
            console.log('Comparing = ' + index + ' with item entry with index ' + cand.index);
            if (cand.index===index) {
                item=cand;
                break;
            }
        }

        return item;
    }

    handleItemDateChanged(event) {
        // eslint-disable-next-line no-console
        console.log('Got item date changed event!');
        let item=this.findItem(event.detail.index);
        if (null!==item) {
            // eslint-disable-next-line no-console
            console.log('Found item!');
            item.SFDXPBP__Date__c=event.detail.value;
        }

        // eslint-disable-next-line no-console
        console.log('Items = ' + JSON.stringify(this.items, null, 4));
    }

    handleItemDescriptionChanged(event) {
        // eslint-disable-next-line no-console
        console.log('Got item description changed event!');
        let item=this.findItem(event.detail.index);
        if (null!==item) {
            // eslint-disable-next-line no-console
            console.log('Found item!');
            item.SFDXPBP__Description__c=event.detail.value;
        }

        // eslint-disable-next-line no-console
        console.log('Items = ' + JSON.stringify(this.items, null, 4));
    }

    handleItemAmountChanged(event) {
        // eslint-disable-next-line no-console
        console.log('Got item description changed event!');
        let item=this.findItem(event.detail.index);
        if (null!==item) {
            // eslint-disable-next-line no-console
            console.log('Found item!');
            item.SFDXPBP__Amount__c=event.detail.value;
        }

        // eslint-disable-next-line no-console
        console.log('Items = ' + JSON.stringify(this.items, null, 4));
    }

    handleAddItem() {
        this.items.push({index: this.idx++});
        // eslint-disable-next-line no-console
        console.log('Items = ' + JSON.stringify(this.items, null, 4));
    }

    handleSave() {
        // eslint-disable-next-line no-console
        console.log('Report = ' + JSON.stringify(this.report, null, 4));
        // eslint-disable-next-line no-console
        console.log('Items = ' + JSON.stringify(this.items, null, 4));

        CreateExpenseReport({report : this.report, items: this.items})
            .then(expenseReport => {
                // eslint-disable-next-line no-console
                console.log('Report = ' + JSON.stringify(expenseReport, null, 4));
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Success',
                    message: 'Expense report ' + expenseReport.Name + ' created',
                    variant: 'success'
                }))
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: error,
                        variant: 'error'
                    })
                );
            });
    }
}