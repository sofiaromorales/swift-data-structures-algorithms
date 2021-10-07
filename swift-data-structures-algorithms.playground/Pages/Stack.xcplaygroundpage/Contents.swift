/*
Generic
LIFO
Facilitiates backtracking
Operations (essentials):
 * `push` adds an element on top
 * `pop` removes the top element
Stacks are crucial to problems that search trees and graphs
 */

public struct Stack<Element> {
    var storage: [Element] = []
    var isEmpty: Bool {
        peek() == nil
    }
    
    init() { }
    init(_ elements: [Element]) {
        self.storage = elements
    }
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public func peek() -> Element? {
        storage.last
    }
    
}

var stack: Stack<Int> = [1,2,3]
stack.push(1)
print(stack)


extension Stack: CustomStringConvertible {
    public var description: String {
        """
        ----top----
        \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
        -----------
        """
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        self.storage = elements
    }
}


//CHALLENGES

//1. Reverse an Array: Create a function that prints the contents of an array in reversed order.
func reverseArray<T>(_ array: [T]) {
    var stack: Stack<T> = Stack(array)
    while let value = stack.pop() {
        print(value)
    }
}
reverseArray([1,2,3])

//2. Balance the parentheses: Check for balanced parentheses. Given a string, check if there are ( and ) characters, and return true if the parentheses in the string are balanced
func balancedParentheses(_ string : String) ->  Bool {
    var stack = Stack<Character>()
    for character in string {
        if character == "(" {
            stack.push(character)
        } else if character == ")" {
            if stack.isEmpty {return false}
            else { stack.pop() }
        }
    }
    return stack.isEmpty
}

balancedParentheses("())(")
