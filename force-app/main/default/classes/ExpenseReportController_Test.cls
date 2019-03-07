@isTest
private class ExpenseReportController_Test 
{
    @isTest
    static void CreateExpenseReportTest()
    {
    	SFDXPBP__Expense_Report__c report=
                new SFDXPBP__Expense_Report__c(Name='Test',
                                               SFDXPBP__Start_Date__c=System.today(),
                                               SFDXPBP__End_Date__c=System.today().addDays(10));

    	SFDXPBP__Expense_Item__c item=
                    new SFDXPBP__Expense_Item__c(SFDXPBP__Date__c=System.today(),
                                                 SFDXPBP__Description__c='Unit Test',
                                                 SFDXPBP__Amount__c=100);

        ExpenseReportController.CreateExpenseReport(report, new List<SFDXPBP__Expense_Item__c>{item});
    }
}