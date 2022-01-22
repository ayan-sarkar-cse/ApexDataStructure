public with sharing class BalancedPartition {
  public static void balancedPartition(String str) {
    if (String.isNotBlank(str)) {
      Integer r = 0, l = 0, ans = 0;
      for (integer i = 0; i < str.length(); i++) {
        if (str.substring(i, i + 1).equalsIgnoreCase('R')) {
          r++;
        } else if (str.substring(i, i + 1).equalsIgnoreCase('L')) {
          l++;
        }
        if (r == l)
          ans++;
      }
      System.debug(ans);
    }
  }
}
/* BalancedPartition.balancedPartition('LRLLRRLRRL');
 BalancedPartition.balancedPartition('LRRRRLLRLLRL'); */
