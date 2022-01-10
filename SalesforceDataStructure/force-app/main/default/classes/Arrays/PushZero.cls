public class PushZero {
  public static void pushZerosToEnd(Integer[] integerArray) {
    System.debug('Input array ==> ' + integerArray);
    Integer nonZeroCount = 0;
    // Put all the non-zero elements to the front of the array
    for (Integer currentElement : integerArray) {
      if (currentElement != 0)
        integerArray[nonZeroCount++] = currentElement;
    }
    // From count till array length put zeros.
    while (nonZeroCount < integerArray.size())
      integerArray[nonZeroCount++] = 0;
    System.debug('Modified array ==> ' + JSON.serialize(integerArray));
  }

  public static void pushZerosToFront(Integer[] integerArray) {
    System.debug('Input array ==> ' + integerArray);
    Integer nonZeroCount = integerArray.size() - 1;
    // Put all the non-zero elements to the end of the array
    for (Integer i = integerArray.size() - 1; i >= 0; i--) {
      if (integerArray[i] != 0)
        integerArray[nonZeroCount--] = integerArray[i];
    }
    // From count till 0th index put zeros.
    while (nonZeroCount >= 0)
      integerArray[nonZeroCount--] = 0;
    System.debug('Modified array ==> ' + JSON.serialize(integerArray));
  }
}
// Code to check the implementation
/* List<Integer> integerArray = new List<Integer>{1, 9, 8, 4, 0, 0, 2, 7, 0, 6, 0, 9};
 PushZero.pushZerosToFront(integerArray);
 PushZero.pushZerosToEnd(integerArray); */
