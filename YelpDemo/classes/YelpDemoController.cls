public class YelpDemoController {    
    
    @AuraEnabled
    public static String objectSelect(String objectType, Id recordId) {
        if (objectType.toLowercase() == 'account') {
            return accountSelect(recordId);
        } else if (objectType.toLowercase() == 'contact') {
            return contactSelect(recordId);
        } else {
            // This is an error....
            return null;
        }
    }

    public static String contactSelect (Id recordId) {
        Contact contact = [SELECT MailingStreet, MailingCity, MailingState FROM Contact WHERE Id=:recordId];
        String location = contact.MailingStreet + ',' + contact.MailingCity + ',' + contact.MailingState;
        return location;
    }
    
    public static String accountSelect (Id recordId) {
        Account account = [SELECT BillingStreet, BillingCity, BillingState FROM Account WHERE Id=:recordId];
        String location = account.BillingStreet + ',' + account.BillingCity + ',' + account.BillingState;
        return location;
    }
}