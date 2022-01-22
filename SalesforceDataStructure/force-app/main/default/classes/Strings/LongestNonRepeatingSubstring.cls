public with sharing class LongestNonRepeatingSubstring {
  public static Integer longestUniqueSubstring(String str) {
    Integer result = 0;
    Integer inputLength = str.length();
    for (Integer i = 0; i < inputLength; i++) {
      Map<String, Boolean> visitedMap = getInitialMap();
      for (Integer j = i; j < inputLength; j++) {
        // Integer characterToCheck = str.toUpperCase().charAt(j) - 65;
        String character = str.toUpperCase().substring(j, j + 1);
        if (visitedMap.get(character)) {
          break;
        } else {
          result = Math.max(result, j - i + 1);
          visitedMap.put(character, true);
        }
      }
      visitedMap = getInitialMap();
    }
    return result;
  }

  public static Map<String, Boolean> getInitialMap() {
    return new Map<String, Boolean>{
      'A' => false,
      'B' => false,
      'C' => false,
      'D' => false,
      'E' => false,
      'F' => false,
      'G' => false,
      'H' => false,
      'I' => false,
      'J' => false,
      'K' => false,
      'L' => false,
      'M' => false,
      'N' => false,
      'O' => false,
      'P' => false,
      'Q' => false,
      'R' => false,
      'S' => false,
      'T' => false,
      'U' => false,
      'V' => false,
      'W' => false,
      'X' => false,
      'Y' => false,
      'Z' => false
    };
  }
}

String str = 'abcabcbb';
Integer len = LongestNonRepeatingSubstring.longestUniqueSubstring(str);
System.debug('len --> ' + len);

