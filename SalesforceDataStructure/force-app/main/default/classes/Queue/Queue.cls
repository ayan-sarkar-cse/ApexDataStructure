public class Queue {
  private List<Object> items { get; set; }

  public Queue() {
    this.items = new List<Object>();
  }

  public Integer size() {
    return this.items.size();
  }

  public Boolean isEmpty() {
    return size() == 0;
  }

  public void enqueue(Object itemToPush) {
    this.items.add(itemToPush);
  }

  public Object dequeue() {
    if (isEmpty()) {
      return null;
    }

    return this.items.remove(0);
  }

  public Object peek() {
    if (isEmpty()) {
      return null;
    }

    return this.items.get(size() - 1);
  }
}
