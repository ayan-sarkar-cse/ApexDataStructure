public with sharing class ContactTriggerHandler implements TriggerHandlerInterface {
  public static ContactTriggerHandler contactTriggerHandler;
  public Boolean isDisabled() {
    if (Trigger_Settings__c.getValues('ContactTrigger').Is_Enabled__c == true)
      return false;
    else
      return true;
  }

  public static ContactTriggerHandler getInstance() {
    if (contactTriggerHandler == null)
      contactTriggerHandler = new ContactTriggerHandler();
    return contactTriggerHandler;
  }

  public void beforeInsert(Map<Id, sObject> newMap) {
  }

  public void beforeUpdate(Map<Id, sObject> oldMap, Map<Id, sObject> newMap) {
  }

  public void beforeDelete(Map<Id, sObject> oldMap) {
  }

  public void afterInsert(Map<Id, sObject> newMap) {
    ContactTriggerService contactTriggerService = ContactTriggerService.getInstance();
    contactTriggerService.updateContactCountInAccount(null, newMap);
  }

  public void afterUpdate(Map<Id, sObject> oldMap, Map<Id, sObject> newMap) {
    ContactTriggerService contactTriggerService = ContactTriggerService.getInstance();
    contactTriggerService.updateContactCountInAccount(oldMap, newMap);
  }

  public void afterDelete(Map<Id, sObject> oldMap) {
    ContactTriggerService contactTriggerService = ContactTriggerService.getInstance();
    contactTriggerService.updateContactCountInAccount(oldMap, null);
  }

  public void afterUndelete(Map<Id, sObject> newMap) {
    ContactTriggerService contactTriggerService = ContactTriggerService.getInstance();
    contactTriggerService.updateContactCountInAccount(null, newMap);
  }
}
