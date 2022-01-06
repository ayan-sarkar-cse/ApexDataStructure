/**
 * Contact Trigger
 */
trigger ContactTrigger on Contact(
  after insert,
  after update,
  after delete,
  after undelete,
  before insert,
  before update,
  before delete
) {
  TriggerDispatcher.Run(ContactTriggerHandler.getInstance());
}
