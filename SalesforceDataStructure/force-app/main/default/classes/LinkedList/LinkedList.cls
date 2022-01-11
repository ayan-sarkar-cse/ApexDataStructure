public class LinkedList {
  Node head; // head of the list
  public class Node {
    Integer data;
    Node next;
    Node(Integer data) {
      this.data = data;
      this.next = null;
    }
  }

  public void printList() {
    Node n = head;
    while (n != null) {
      System.debug(n.data + ' ');
      n = n.next;
    }
  }

  public void pushToFront(Integer data) {
    Node newNode = new Node(data);
    newNode.next = head;
    head = newNode;
  }

  public void deleteNode(Integer key) {
    Node temp = head;
    Node prev = null;
    if (temp != null && temp.data == key) {
      head = head.next;
      return;
    }
    while (temp != null && temp.data != key) {
      prev = temp;
      temp = temp.next;
    }

    if (temp == null)
      return;
    prev.next = temp.next;
  }

  public void deleteNodeFromPosition(Integer position) {
    if (head == null)
      return;
    Node temp = head;
    if (position == 0) {
      head = temp.next;
      return;
    }
    for (Integer i = 0; temp != null && i < position - 1; i++) {
      temp = temp.next;
    }
    temp.next = temp.next.next;
  }
}

// Code to check the implementation
/* LinkedList llist = new LinkedList();
llist.pushToFront(7);
llist.pushToFront(1);
llist.pushToFront(3);
llist.pushToFront(2);

System.debug('Created Linked list is:');
llist.printList();

llist.deleteNodeFromPosition(2);
llist.printList(); */

