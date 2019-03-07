public with sharing class ExpenseReportAccessor {
    public static SFDXPBP__Expense_Report__c GetReport(Id reportId) {
        List<SFDXPBP__Expense_Report__c> reports=[select Id, Name, SFDXPBP__Start_Date__c, SFDXPBP__End_Date__c
                                                  from SFDXPBP__Expense_Report__c
                                                  where id=:reportId];

        SFDXPBP__Expense_Report__c result;
        if (!reports.IsEmpty())
        {
            result=reports[0];
        }

        return result;
    }

    public static SFDXPBP__Expense_Report__c GetReportAndItems(Id reportId) {
        List<SFDXPBP__Expense_Report__c> reports=[select Id, Name, SFDXPBP__Start_Date__c, SFDXPBP__End_Date__c,
                                                  (select Id, Name, SFDXPBP__Description__c, SFDXPBP__Date__c, SFDXPBP__Amount__c
                                                   from SFDXPBP__Expense_Items__r)
                                                  from SFDXPBP__Expense_Report__c
                                                  where id=:reportId];

        SFDXPBP__Expense_Report__c result;
        if (!reports.IsEmpty())
        {
            result=reports[0];
        }

        return result;
    }

    public static List<SFDXPBP__Expense_Report__c> GetAllReports()
    {
        return [select Id, Name, SFDXPBP__Start_Date__c, SFDXPBP__End_Date__c
                                                  from SFDXPBP__Expense_Report__c];
    }
}