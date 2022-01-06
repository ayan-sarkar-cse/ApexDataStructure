/**
 * OpportunityLineItemTriggerService
**/
public class OpportunityLineItemTriggerService {
    public static OpportunityLineItemTriggerService opportunityLineItemTriggerService;
    public static OpportunityLineItemTriggerService getInstance(){
        if (opportunityLineItemTriggerService == null)
            opportunityLineItemTriggerService = new OpportunityLineItemTriggerService();
        return opportunityLineItemTriggerService;
    }

    public void updateAmountOnOpportunityAndAccount(Map<Id, sObject> oldMap, Map<Id, sObject> newMap) {
        Map<Id, OpportunityLineItem> oldOLIMap = (Map<Id, OpportunityLineItem>) oldMap;
        Map<Id, OpportunityLineItem> newOLIMap = (Map<Id, OpportunityLineItem>) newMap;
        List<Opportunity> opportunityListToUpdate = new List<Opportunity>();
        // Conditions for Insert, Update and Undelete
        /* if (newOLIList != null && !newOLIList.isEmpty()) {
            for (OpportunityLineItem opportunityLineItem : newOLIList) {
                // Insert scenario
                if (oldOLIMap == null) {
                    if (!opportunityToAmountMapAddition.contains(opportunityLineItem.OpportunityId))
                        opportunityToAmountMapAddition.put(opportunityLineItem.OpportunityId,
                            opportunityLineItem.TotalPrice);
                    else {
                        Double presentAmount = opportunityToAmountMapAddition.get(opportunityLineItem.OpportunityId);
                        opportunityToAmountMapAddition.put(opportunityLineItem.OpportunityId,
                            presentAmount + opportunityLineItem.TotalPrice);
                    }
                }
                // Update scenario
                if (oldOLIMap != null) {

                }
            }
        } */
        Set<Id> opportunityIdSet = new Set<Id>();
        if (newOLIMap != null && !newOLIMap.isEmpty())
            for (OpportunityLineItem opportunityLineItem : newOLIMap.values())
                opportunityIdSet.add(opportunityLineItem.OpportunityId);

        if (oldOLIMap != null && !oldOLIMap.isEmpty())
            for (OpportunityLineItem opportunityLineItem : oldOLIMap.values())
                opportunityIdSet.add(opportunityLineItem.OpportunityId);

        List<AggregateResult> opportunityLineItemList = [
            SELECT
                OpportunityId,
                SUM(TotalPrice) opportunityLineItemPriceSum
            FROM
                OpportunityLineItem
            WHERE
                OpportunityId in :opportunityIdSet
            GROUP BY
                OpportunityId
        ];

        for (AggregateResult aggregateResult : opportunityLineItemList) {
            opportunityListToUpdate.add(
                new Opportunity(
                    Id = (Id) aggregateResult.get('OpportunityId'),
                    OLI_Amount__C = (Decimal) aggregateResult.get('opportunityLineItemPriceSum')
                )
            );
        }
        update opportunityListToUpdate;
    }
}