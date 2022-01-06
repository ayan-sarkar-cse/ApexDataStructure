/**
 * Given a sorted array of integers, return the low and high index of the given key.
 * You must return -1 if the indexes are not found.
 */
public class FirstAndLastOccurence {
  public static Integer findFirstAndLastOccurenceOfElement(
    Integer[] integerArray,
    Integer key,
    Boolean findLowerIndex
  ) {
    // search space is integerArray[left…right]
    Integer left = 0;
    Integer right = integerArray.size() - 1;

    // initialize the result by -1
    Integer result = -1;

    // loop till the search space is exhausted
    while (left <= right) {
      // find the mid-value in the search space and compares it with the key
      Integer mid = (left + right) / 2;

      // if the key is located, update the result and
      // search towards the left (lower indices)
      if (key == integerArray[mid]) {
        result = mid;
        if (findLowerIndex)
          right = mid - 1;
        else
          left = mid + 1;
      } else if (key < integerArray[mid]) {
        // if the key is less than the middle element, discard the right half
        right = mid - 1;
      } else {
        // if the key is more than the middle element, discard the left half
        left = mid + 1;
      }
    }

    // return the leftmost index, or -1 if the element is not found
    return result;
  }
}

// Code to check the implementation
List<Integer> integerArray = new List<Integer> {1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 4, 4, 4,4, 5, 5, 5, 6, 6, 6, 6, 6, 6};
Integer key = 4;
Integer low = FirstAndLastOccurence.findFirstAndLastOccurenceOfElement(integerArray, key, true);
Integer high = FirstAndLastOccurence.findFirstAndLastOccurenceOfElement(integerArray, key, false);
System.debug('Lower index ==> ' + low);
System.debug('Higher index ==> ' + high);