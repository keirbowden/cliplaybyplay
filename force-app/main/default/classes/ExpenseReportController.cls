public with sharing class ExpenseReportController {
    @AuraEnabled 
    public static SFDXPBP__Expense_Report__c CreateExpenseReport(SFDXPBP__Expense_Report__c report,
                                                            List<SFDXPBP__Expense_Item__c> items)
    {
        insert report;

        for (SFDXPBP__Expense_Item__c item : items)
        {
            item.SFDXPBP__Expense_Report__c=report.id;
            insert item;
        }

        return report;
    }
}