public class SwapVowels {
  public static String swapVowels(String sentence) {
    Integer leftPointer = 0;
    Integer rightPointer = sentence.length() - 1;
    List<String> sentenceArray = sentence.split('');
    System.debug(sentenceArray);

    while (rightPointer > leftPointer) {
      if (!isVowel(sentenceArray[leftPointer])) {
        leftPointer++;
        continue;
      }
      if (!isVowel(sentenceArray[rightPointer])) {
        rightPointer--;
        continue;
      }
      //Code to swap
      String tempChar = sentenceArray[leftPointer];
      sentenceArray[leftPointer] = sentenceArray[rightPointer];
      sentenceArray[rightPointer] = tempChar;
      leftPointer++;
      rightPointer--;
    }
    return String.join(sentenceArray, '');
  }
  // Utility method to check if the current character is a vowel.
  public static Boolean isVowel(String character) {
    if (
      character.equalsIgnoreCase('a') ||
      character.equalsIgnoreCase('e') ||
      character.equalsIgnoreCase('i') ||
      character.equalsIgnoreCase('o') ||
      character.equalsIgnoreCase('u')
    ) {
      return true;
    } else {
      return false;
    }
  }
}

// Code to check the implementation
/* System.debug(SwapVowels.swapVowels('Aishwarya Ranjan'));
 System.debug(SwapVowels.swapVowels('Hello World'));  */

