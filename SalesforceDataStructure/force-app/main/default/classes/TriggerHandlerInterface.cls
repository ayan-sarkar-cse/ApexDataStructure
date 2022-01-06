/**
 * Trigger Handler Interface
**/
public Interface TriggerHandlerInterface {
    void beforeInsert(Map<Id, sObject> newMap);
    void beforeUpdate(Map<Id, sObject> oldMap, Map<Id, sObject> newMap);
    void beforeDelete(Map<Id, sObject> oldMap);
    void afterInsert(Map<Id, sObject> newMap);
    void afterUpdate(Map<Id, sObject> oldMap, Map<Id, sObject> newMap);
    void afterDelete(Map<Id, sObject> oldMap);
    void afterUndelete(Map<Id, sObject> newMap);
    Boolean isDisabled();
}