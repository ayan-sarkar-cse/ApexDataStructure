/**
 * Trigger Dispatcher
**/
public class TriggerDispatcher {
    public static void run(TriggerHandlerInterface triggerHandlerObj) {
        if (triggerHandlerObj.isDisabled())
            return;

        // Before Logic.
        if (Trigger.isBefore) {
            if (Trigger.isInsert)
                triggerHandlerObj.beforeInsert(Trigger.newMap);
            else if (Trigger.isUpdate)
                triggerHandlerObj.beforeUpdate(Trigger.oldMap,Trigger.newMap);
            else if (Trigger.isDelete)
                triggerHandlerObj.beforeDelete(Trigger.oldMap);
        }
        // After Logic.
        if (Trigger.isAfter) {
            if (Trigger.isInsert)
                triggerHandlerObj.afterInsert(Trigger.newMap);
            else if (Trigger.isUpdate)
                triggerHandlerObj.afterUpdate(Trigger.oldMap,Trigger.newMap);
            else if (Trigger.isDelete)
                triggerHandlerObj.afterDelete(Trigger.oldMap);
            else if (Trigger.isUndelete)
                triggerHandlerObj.afterUndelete(Trigger.newMap);
        }
    }
}