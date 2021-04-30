import UIKit

// MARK: - Задача 2
protocol Container {
	associatedtype Item
	func size() -> Int
	mutating func push(_ item: Item)
	subscript(i: Int) -> Item? { get }
}

struct LinkedList<Element>: Container {
	public class Node {
		var value: Element
		var next: Node?
		
		init (_ value: Element) {
			self.value = value
		}
	}
	private var count: Int = 1
	var head: Node
	
	init(_ value: Element) {
		self.head = Node(value)
	}
	func size() -> Int {
		return count
	}
	
	subscript(i: Int) -> Element? {
		var newNode = head
		for _ in 0...i {
			if (newNode.next != nil) {
				newNode = newNode.next!
			} else {
				return nil
			}
		}
		return newNode.value
	}
	mutating func push(_ item: Element) {
		let newNode = Node(item)
		var tmpNode = head
		while tmpNode.next != nil {
			tmpNode = tmpNode.next!
		}
		tmpNode.next = newNode
		count += 1
	}
}

var list = LinkedList<Int>(5)
list.push(10)
list.push(10)
list.push(10)
print(list)
