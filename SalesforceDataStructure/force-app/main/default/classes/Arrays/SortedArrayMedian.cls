public with sharing class SortedArrayMedian {
  public static Integer SortedArrayMedian(
    List<Integer> array1,
    List<Integer> array2
  ) {
    List<Integer> array3 = new List<Integer>();
    array3.addAll(array1);
    array3.addAll(array2);
    array3.sort();
    Integer array3Length = array3.size();
    if (Math.mod(array3Length, 2) == 0) {
      Integer middleIndex = array3Length / 2;
      Integer middleElement = array3[middleIndex];
      Integer middleElementBut1 = array3[middleIndex - 1];
      return (middleElement + middleElementBut1) / 2;
    } else {
      return array3[Math.round(array3Length / 2)];
    }
  }
}

Integer[] arr1 = new List<Integer>{2, 3, 5, 8};
Integer[] arr2 = new List<Integer>{10, 12, 14, 16, 18, 20};
System.debug(SortedArrayMedian.SortedArrayMedian(arr1, arr2));