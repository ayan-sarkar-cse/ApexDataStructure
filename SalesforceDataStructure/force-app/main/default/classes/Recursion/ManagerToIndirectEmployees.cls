public class ManagerToIndirectEmployees {
  // Manager to subordinate
  public static void createManagerToEmployeesMap(
    String managerName,
    Map<String, String> employeeToManagerMap
  ) {
    Map<String, Set<String>> managetToEmployeesMap = new Map<String, Set<String>>();
    for (String employeeKey : employeeToManagerMap.keySet()) {
      String manager = employeeToManagerMap.get(employeeKey);
      if (managetToEmployeesMap.containsKey(manager)) {
        managetToEmployeesMap.get(manager).add(employeeKey);
      } else {
        managetToEmployeesMap.put(manager, new Set<String>{ employeeKey });
      }
    }
    // Integer finalCount = getNumberOfEmployeesForAManager(managerName, managetToEmployeesMap);
    Set<String> finalCount = getNumberOfEmployeesForAManager(
      managerName,
      managetToEmployeesMap
    );
    System.debug('finalCount => ' + finalCount);
  }

  public static Set<String> getNumberOfEmployeesForAManager(
    String managerName,
    Map<String, Set<String>> managetToEmployeesMap
  ) {
    // Integer count = 0;
    Set<String> allSubordinates = new Set<String>();

    if (!managetToEmployeesMap.containsKey(managerName)) {
      // return 0;
      return new Set<String>();
    } else {
      Set<String> directRepotees = managetToEmployeesMap.get(managerName);
      // count = directRepotees.size();
      allSubordinates = directRepotees;
      for (String directRepotee : directRepotees) {
        // count += getNumberOfEmployeesForAManager(directRepotee, managetToEmployeesMap);
        directRepotees.addAll(
          getNumberOfEmployeesForAManager(directRepotee, managetToEmployeesMap)
        );
      }
    }
    // return count;
    return allSubordinates;
  }
}

// Code to check the implementation
/* Map<String, String> employeeToManagerMap = new Map<String, String>{
    'Ayan' => 'Chellam',
    'Bikram' => 'Chellam',
    'Chellam' => 'Final Chellam',
    'Dinesh' => 'Einstein',
    'Einstein' => 'Final Chellam'
  };
  
ManagerToIndirectEmployees.createManagerToEmployeesMap('Final Chellam', employeeToManagerMap); */

