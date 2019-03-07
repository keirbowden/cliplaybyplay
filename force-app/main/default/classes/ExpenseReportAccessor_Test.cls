@isTest
private class ExpenseReportAccessor_Test 
{
    @isTest
    static void GetReportTest()
    {
        SFDXPBP__Expense_Report__c report=
                new SFDXPBP__Expense_Report__c(Name='Test',
                                               SFDXPBP__Start_Date__c=System.today(),
                                               SFDXPBP__End_Date__c=System.today().addDays(10));
        insert report;

        Test.startTest();
        ExpenseReportAccessor.GetReport(report.id);
        Test.stopTest();

        System.assertNotEquals(null, report.id);
    }

    @isTest
    static void GetReportAndItemsTest()
    {
        SFDXPBP__Expense_Report__c report=
                new SFDXPBP__Expense_Report__c(Name='Test',
                                               SFDXPBP__Start_Date__c=System.today(),
                                               SFDXPBP__End_Date__c=System.today().addDays(10));
        insert report;

    	SFDXPBP__Expense_Item__c item=
                    new SFDXPBP__Expense_Item__c(SFDXPBP__Date__c=System.today(),
                                                 SFDXPBP__Description__c='Unit Test',
                                                 SFDXPBP__Amount__c=100,
                                                 SFDXPBP__Expense_Report__c=report.id);

        insert item;

        Test.startTest();
        ExpenseReportAccessor.GetReportAndItems(report.id);
        Test.stopTest();

        System.assertNotEquals(null, report.id);
        System.assertNotEquals(1, report.SFDXPBP__Expense_Items__r.size());
    }

    @isTest
    static void GetAllReportsTest()
    {
        List<SFDXPBP__Expense_Report__c> reports=new List<SFDXPBP__Expense_Report__c>();
        for (Integer idx=0; idx<10; idx++)
        {
            SFDXPBP__Expense_Report__c report=
                    new SFDXPBP__Expense_Report__c(Name='Test',
                                                   SFDXPBP__Start_Date__c=System.today(),
                                                   SFDXPBP__End_Date__c=System.today().addDays(10));
            reports.add(report);
        }
        insert reports;

        Test.startTest();
        List<SFDXPBP__Expense_Report__c> reps=ExpenseReportAccessor.GetAllReports();
        Test.stopTest();

        System.assertEquals(10, reps.size());
    }

}