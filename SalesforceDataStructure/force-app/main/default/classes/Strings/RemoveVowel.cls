public with sharing class RemoveVowel {
  public static void removeVowel(String input) {
    for (Integer i = 0; i < input.length(); i++) {
      if (isVowel(input.substring(i, i + 1))) {
        input = input.replaceFirst(input.substring(i, i + 1), '');
      }
    }
    System.debug('After Removel --> ' + input);
  }

  public static Boolean isVowel(String str) {
    if (
      str.equalsIgnoreCase('A') ||
      str.equalsIgnoreCase('E') ||
      str.equalsIgnoreCase('I') ||
      str.equalsIgnoreCase('O') ||
      str.equalsIgnoreCase('U')
    ) {
      return true;
    }
    return false;
  }
}

String inputStr = 'Ayan Sarkar';
 RemoveVowel.removeVowel(inputStr);

