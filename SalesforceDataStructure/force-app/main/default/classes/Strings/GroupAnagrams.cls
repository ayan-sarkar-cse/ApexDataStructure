public class GroupAnagrams {
  public static void groupAnagrams(List<String> inputString) {
    Map<Integer, List<String>> output = new Map<Integer, List<String>>();
    for (String input : inputString) {
      Integer characterASCIISum = getWordToASCIISum(input);
      if (output.containsKey(characterASCIISum)) {
        output.get(characterASCIISum).add(input);
      } else {
        output.put(characterASCIISum, new List<String>{ input });
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
    'eat', 'tea', 'ate', 'ayan', 'naya', 'mad', 'dam', 'mda', 'ay', 'bz'
}); */

