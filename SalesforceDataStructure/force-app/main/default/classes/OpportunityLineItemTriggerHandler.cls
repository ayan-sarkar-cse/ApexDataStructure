/**
 * Opportunity Line Item Trigger Hangler
**/
public class OpportunityLineItemTriggerHandler implements TriggerHandlerInterface{
    public static OpportunityLineItemTriggerHandler opportunityLineItemTriggerHandler;
    public Boolean isDisabled() {
        if (Trigger_Settings__c.getValues('OpportunityLineItemTrigger').Is_Enabled__c == TRUE)
            return FALSE;
        else
            return TRUE;
    }

    public static OpportunityLineItemTriggerHandler getInstance() {
        if (opportunityLineItemTriggerHandler == null)
            opportunityLineItemTriggerHandler = new OpportunityLineItemTriggerHandler();
        return opportunityLineItemTriggerHandler;
    }

    public void beforeInsert(Map<Id, sObject> newMap) {

    }

    public void beforeUpdate(Map<Id, sObject> oldMap, Map<Id, sObject> newMap) {

    }

    public void beforeDelete(Map<Id, sObject> oldMap) {

    }

    public void afterInsert(Map<Id, sObject> newMap) {
        OpportunityLineItemTriggerService opportunityLineItemTriggerService =
            OpportunityLineItemTriggerService.getInstance();
        opportunityLineItemTriggerService.updateAmountOnOpportunityAndAccount(null, newMap);
    }

    public void afterUpdate(Map<Id, sObject> oldMap, Map<Id, sObject> newMap) {
        OpportunityLineItemTriggerService opportunityLineItemTriggerService =
            OpportunityLineItemTriggerService.getInstance();
        opportunityLineItemTriggerService.updateAmountOnOpportunityAndAccount(oldMap, newMap);
    }

    public void afterDelete(Map<Id, sObject> oldMap) {
        OpportunityLineItemTriggerService opportunityLineItemTriggerService =
            OpportunityLineItemTriggerService.getInstance();
        opportunityLineItemTriggerService.updateAmountOnOpportunityAndAccount(oldMap, null);
    }

    public void afterUndelete(Map<Id, sObject> newMap) {
        OpportunityLineItemTriggerService opportunityLineItemTriggerService =
            OpportunityLineItemTriggerService.getInstance();
        opportunityLineItemTriggerService.updateAmountOnOpportunityAndAccount(null, newMap);
    }
}