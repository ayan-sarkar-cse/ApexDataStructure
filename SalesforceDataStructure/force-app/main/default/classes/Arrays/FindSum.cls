public with sharing class FindSum {
  public static Boolean findSumOfTwo(Integer[] integerArray, Integer value) {
    Set<Integer> foundValues = new Set<Integer>();
    for (Integer currentValue : integerArray) {
      if (foundValues.contains(value - currentValue)) {
        return true;
      }
      foundValues.add(currentValue);
    }
    return false;
  }
}

// Code to check the implementation
/* Boolean result1 = FindSum.findSumOfTwo(new List<Integer> {3, 20, 1, 2, 7}, 8);
System.debug('Result1 ==> ' + result1); // true
Boolean result2 = FindSum.findSumOfTwo(new List<Integer> {3, 20, 1, 2, 7}, 9);
System.debug('Result2 ==> ' + result2); // true
Boolean result3 = FindSum.findSumOfTwo(new List<Integer> {3, 20, 1, 2, 7}, 24);
System.debug('Result3 ==> ' + result3); // false
Boolean result4 = FindSum.findSumOfTwo(new List<Integer> {3, 20, 1, 2, 7}, 3);
System.debug('Result4 ==> ' + result4); // true */

