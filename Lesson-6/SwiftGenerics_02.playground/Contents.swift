import UIKit

// MARK: - Задача 2
protocol Container {
	associatedtype Item
	func size() -> Int
	mutating func push(_ item: Item)
	subscript(i: Int) -> Item? { get }
	mutating func pop() -> Item?
}

struct LinkedList<Element>: Container {
	private class Node {
		var value: Element
		var next: Node?
		
		init (_ value: Element) {
			self.value = value
		}
	}
	private var count: Int = 0
	private var head: Node? = nil
	
	func size() -> Int { return count }
	subscript(i: Int) -> Element? {
		let index = (i < 0) ? count + i : i
		
		if var tmpNode = head, index < count {
			for _ in 0..<index {
				tmpNode = tmpNode.next!
			}
			return tmpNode.value
		}
		return nil
	}
	mutating func pushFront(_ item: Element) {
		let newNode = Node(item)
		newNode.next = head
		head = newNode
		count += 1
	}
	mutating func push(_ item: Element) {
		if var tmpNode = head {
			while tmpNode.next != nil {
				tmpNode = tmpNode.next!
			}
			tmpNode.next = Node(item)
		} else {
			head = Node(item)
		}
		count += 1
	}
	
	mutating func pop() -> Element? {
		if let tmpNode = head {
			head = head?.next
			count -= 1
			return tmpNode.value
		}
		return nil
	}
	func listOut() {
		if var tmpNode = head {
			for _ in 0..<count {
				print(tmpNode.value)
				tmpNode = tmpNode.next ?? tmpNode
			}
		}
	}
}

struct Queue<Element>: Container {
	mutating func pop() -> Element? {
		return elem.pop()
	}
	
	private var elem = LinkedList<Element>()
	func size() -> Int {
		return elem.size()
	}
	
	mutating func push(_ item: Element) {
		elem.push(item)
	}
	
	subscript(i: Int) -> Element? {
		return elem[i]
	}
	func queueOut() {
		elem.listOut()
	}
}

var list = LinkedList<Int>()
list.push(3)
list.push(5)
list.push(8)
print(list[-1] ?? "NULL")
print(list[3] ?? "NULL")
list.listOut()
print(list.size())
list.pushFront(10)
list.listOut()
print(list.size())

var queue = Queue<String>()
queue.push("One")
queue.push("Two")
queue.push("Three")
queue.push("Four")
var size = queue.size() - 1
for _ in 0...size {
	print(queue.pop()!)
}
