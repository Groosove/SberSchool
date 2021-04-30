import UIKit


/*
** Lection: Generics
*/

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
	let tmp = a
	a = b
	b = tmp
}

var arr = Array(repeating: 5, count: 10)
arr.reduce(0, { $0 + $1 })

struct Stack<Elem> {
	var items = Array<Elem>()
	mutating func push(_ item: Elem) { items.append(item) }
	mutating func pop() -> Elem { return items.removeLast() }
}

extension Stack {
	var begin: Elem? {
		return !items.isEmpty ? items.last : nil
	}
}

var stack: Stack<String> = Stack()
stack.push("one")
stack.push("two")
stack.push("three")
stack.push("four")

if let value = stack.begin {
	print("First element - \(value)")
}

func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
	for (index, value) in array.enumerated() {
		if value == valueToFind {
			return index
		}
	}
	return nil
}

let index = findIndex(of: "Alesha", in: ["Alex", "Misha", "Alesha"])


func sum<T>(_ a: T, _ b: T) -> T where T: AdditiveArithmetic {
	return a + b
}

sum(25.0, 36.0)
sum(0, 10)
//sum("Hello,", " World")

protocol Container {
	associatedtype Item
	mutating func append(_ item: Item)
	var count: Int { get }
	subscript(i: Int) -> Item { get }
}

struct IntStack: Container {
	typealias Item = Int
	var items = [Item]()
	mutating func append(_ item: Int) {
		self.push(item)
	}
	
	var count: Int { items.count }
	
	subscript(i: Int) -> Int { items[i] }
	
	mutating func push(_ item: Int) { items.append(item) }
	mutating func pop() -> Int { return items.removeLast() }
}

struct StackTwo<Element>: Container {
	var items = [Element]()
	typealias Item = Element
	mutating func append(_ item: Element) {
		self.push(item)
	}
	var count: Int { items.count }
	
	subscript(i: Int) -> Element { items[i] }
	
	
	mutating func push(_ item: Element) { items.append(item) }
	mutating func pop() -> Element { return items.removeLast() }
}

indirect enum LinkedList<Element> {
	case None
	case Next(LinkedList)
}
