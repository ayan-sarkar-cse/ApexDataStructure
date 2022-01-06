/**
 * Opportunity Line Item Trigger
 */
trigger OpportunityLineItemTrigger on OpportunityLineItem (after insert, after update, after delete,
    after undelete, before insert, before update, before delete) {
        TriggerDispatcher.Run(OpportunityLineItemTriggerHandler.getInstance());
}