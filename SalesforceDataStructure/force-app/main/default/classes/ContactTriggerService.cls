public class ContactTriggerService {
  public static ContactTriggerService contactTriggerService;
  public static ContactTriggerService getInstance() {
    if (contactTriggerService == null)
      contactTriggerService = new ContactTriggerService();
    return contactTriggerService;
  }

  public void updateContactCountInAccount(
    Map<Id, sObject> oldMap,
    Map<Id, sObject> newMap
  ) {
    Map<Id, Contact> oldContactMap = (Map<Id, Contact>) oldMap;
    Map<Id, Contact> newContactMap = (Map<Id, Contact>) newMap;
    List<Account> accountListToUpdate = new List<Account>();
    Map<Id, Integer> accountIdToContactCountMap = new Map<Id, Integer>();
    Set<Id> accountIdSet = new Set<Id>();
    if (oldContactMap != null && !oldContactMap.isEmpty())
      for (Contact contact : oldContactMap.values()) {
        accountIdSet.add(contact.AccountId);
        accountIdToContactCountMap.put(contact.AccountId, 0);
      }
    if (newContactMap != null && !newContactMap.isEmpty())
      for (Contact contact : newContactMap.values()) {
        accountIdSet.add(contact.AccountId);
        accountIdToContactCountMap.put(contact.AccountId, 0);
      }

    System.debug('accountIdSet ==> ' + accountIdSet);
    List<AggregateResult> contactList = [
      SELECT AccountId, COUNT(Id) contactCount
      FROM Contact
      WHERE AccountId IN :accountIdSet
      GROUP BY AccountId
    ];

    for (AggregateResult aggregateResult : contactList) {
      accountIdSet.remove((Id) aggregateResult.get('AccountId'));
      accountListToUpdate.add(
        new Account(
          Id = (Id) aggregateResult.get('AccountId'),
          Contact_Count__C = (Integer) aggregateResult.get('contactCount')
        )
      );
    }

    // Logic to append the left over accountIds to accountListToUpdate,
    // used specifically when the AccountId is changed for a contact
    for (Id accountId : accountIdSet) {
      accountListToUpdate.add(
        new Account(Id = accountId, Contact_Count__C = 0)
      );
    }
    update accountListToUpdate;
  }
}
