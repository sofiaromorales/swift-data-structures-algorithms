/*
Generic
Collection of values arranged in a linear unidirectional sequence.
 Charactersitics:
 * Constant time insertion and removal from the front of the list
Operations:
 * `push` Adds a value at the front of the list
 * `append` Adds a value at the end of the list
 * `insert(after:)` Adds a value after a particular node of the list.
 * `pop` removes first node
*/


public class Node<Element> {
    var value: Element
    var next: Node?
    
    init(value: Element, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

//EXAMPLE:
let node1 = Node(value: 1)
let node2 = Node(value:2)
let node3 = Node(value: 3)
//
//node1.next = node2
//node2.next = node3
//
//print(node1)

public struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: self.head)
        if tail == nil {
            tail = head
        }
    }
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        while currentIndex < index {
            guard currentNode != nil else {
                return nil
            }
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        guard node !== self.tail else {
            append(value)
            return self.tail!
        }
        node.next = Node(value: value, next: node.next!)
        return node.next!
    }
    
    public mutating func pop() -> Value? {
        head = head?.next
        if isEmpty {
            tail = nil
        }
        return head?.value
    }
    
    public mutating func removeLast() -> Value? {
        guard !isEmpty else { return nil }
        guard head!.next != nil else {
            return pop()
        }
        var prev = head
        var current = head
        while current!.next != nil {
            prev = current
            current = current!.next
        }
        prev!.next = nil
        tail = prev
        return tail?.value
    }
    
    public mutating func remove(after node: Node<Value>) -> Value? {
        if (node.next?.next == nil) {
            return removeLast()
        }
        node.next = node.next?.next
        return node.next?.value
    }
}

var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)
list.append(4)
list.append(5)
list.append(6)
var middleNode = list.node(at: 2)!
list.insert(7, after: middleNode)
list.pop()
//list.pop()
//list.removeLast()
//list.remove(after: middleNode)
print(list)




extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = self.next else {
            return "\(value)"
        }
        return "\(value) -> \(next)"
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = self.head else {
            return "empty"
        }
        return "\(head)"
    }
}

//CHALLENGES

//1.Print in reverse: Create a function that prints the nodes of a linked list in reverse order.

func printInReverse<T>(_ node: Node<T>?) {
    guard node != nil else { return }
    printInReverse(node?.next)
    print(node!.value)
}

//printInReverse(list.head!)

//2. Find the middle node: Create a function that finds the middle node of a linked list.

func findMiddleNode<T>(_ list: LinkedList<T>?) {
    var slow = list?.head
    var fast = list?.head
    
    while fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    print(slow?.value)
}

//findMiddleNode(list)

//3. Reverse a linked list: Create a function that reverses a linked list. You do this by manipulating the nodes so that they’re linked in the other direction.

print("reverseLinkedlist")

list.reverse()


extension LinkedList {
    mutating func reverse() {
        print("reverse")
        self.tail = self.head
        var current = self.head?.next
        var prev = self.head
        while current != nil {
            print(current)
            var next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        self.head = prev
        print(self)
    }
}
