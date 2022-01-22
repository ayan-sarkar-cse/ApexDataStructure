public with sharing class LongestPalindromeLength {
  public static Integer longestPalindrome(String str) {
    Integer result = 0;
    Integer inputLength = str.length();
    for (Integer i = 0; i < inputLength; i++) {
      for (Integer j = i; j < inputLength; j++) {
        String currentWord = str.substring(i, j + 1);
        System.debug('currentWord ---> ' + currentWord);
        if (currentWord.equalsIgnoreCase(currentWord.reverse())) {
          result = Math.max(result, j - i + 1);
          System.debug('Result ---> ' + result);
        }
      }
    }
    return result;
  }
}

/* String str = 'forgeeksskeegfor';
 System.debug(LongestPalindromeLength.longestPalindrome(str)); */

