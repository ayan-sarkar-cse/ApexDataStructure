public class MergeOverlappingIntervals {
  // Defining the Interval class and making it comparable for sorting.
  public class Interval implements Comparable {
    public Integer beginningTime;
    public Integer finishingTime;

    public Interval(Integer beginningTime, Integer finishingTime) {
      this.beginningTime = beginningTime;
      this.finishingTime = finishingTime;
    }

    public Integer compareTo(Object objToCompare) {
      Interval interval = (Interval) objToCompare;
      if (beginningTime == interval.beginningTime)
        return 0;
      else if (beginningTime > interval.beginningTime)
        return 1;
      else
        return -1;
    }
  }

  public static void mergeIntervals(Interval[] intervals) {
    if (intervals == null || intervals.size() == 0 || intervals.isEmpty()) {
      return;
    }
    // Sorting the Intervals array in the ascending order of the beginning time.
    intervals.sort();

    Stack stack = new Stack();

    // Push the first interval to stack
    stack.push(intervals[0]);

    for (Interval currentInterval : intervals) {
      Interval top = (Interval) stack.peek();
      System.debug('top ==> ' + top);
      System.debug('currentInterval ==> ' + currentInterval);
      // If current interval is not overlapping with top then push it to stack
      if (top.finishingTime < currentInterval.beginningTime) {
        stack.push(currentInterval);
      } else {
        // Else just update the finishing time based on which ever end time is higher
        top.finishingTime = top.finishingTime > currentInterval.finishingTime
          ? top.finishingTime
          : currentInterval.finishingTime;
      }
    }

    // Print the stack values
    while (!stack.isEmpty()) {
      Interval t = (Interval) stack.pop();
      System.debug('POPPING');
      System.debug('[' + t.beginningTime + ',' + t.finishingTime + '] ');
    }
  }
}

// Code to check the implementation
/* List<MergeOverlappingIntervals.Interval> intervalList = new List<MergeOverlappingIntervals.Interval>{
    new MergeOverlappingIntervals.Interval(6,8),
    new MergeOverlappingIntervals.Interval(1,9),
    new MergeOverlappingIntervals.Interval(2,4),
    new MergeOverlappingIntervals.Interval(4,7)
};
List<MergeOverlappingIntervals.Interval> intervalList = new List<MergeOverlappingIntervals.Interval>{
    new MergeOverlappingIntervals.Interval(22,28),
    new MergeOverlappingIntervals.Interval(1,8),
    new MergeOverlappingIntervals.Interval(25,27),
    new MergeOverlappingIntervals.Interval(14,19),
    new MergeOverlappingIntervals.Interval(27,30),
    new MergeOverlappingIntervals.Interval(5,12)
};
MergeOverlappingIntervals.mergeIntervals(intervalList); */

