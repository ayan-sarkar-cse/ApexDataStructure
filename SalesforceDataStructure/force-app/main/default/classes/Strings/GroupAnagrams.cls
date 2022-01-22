public class GroupAnagrams {
  public static void groupAnagrams(List<String> inputString) {
    Map<String, List<String>> output = new Map<String, List<String>>();
    for (String input : inputString) {
      //   Integer characterASCIISum = getWordToASCIISum(input);
      List<String> characters = input.split('');
      characters.sort();
      String sortedString = String.join(characters, '');
      System.debug(sortedString);
      if (output.containsKey(sortedString)) {
        output.get(sortedString).add(input);
      } else {
        output.put(sortedString, new List<String>{ input });
      }
    }
    System.debug(output.values());
  }

  public static Integer getWordToASCIISum(String input) {
    Integer output = 0;
    for (Integer i = 0; i < input.length(); i++) {
      output += input.charAt(i);
    }
    return output;
  }
}

/* GroupAnagrams.groupAnagrams(new List<String>{
    'eat', 'tea', 'ate', 'ayan', 'naya', 'mad', 'dam', 'mda', 'cc', 'bd'
}); */

