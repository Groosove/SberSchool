import Foundation

// MARK: - Задача 3*. К выполнению необязательна. 
indirect enum LinkedList<T> {
	case null(value: T?)
	case next(value: T, LinkedList)
}

let linkedList = LinkedList.next(value: 5, LinkedList.next(value: 10, LinkedList.next(value: 3, LinkedList.null(value: nil))))

var iterateNode = linkedList
MainLoop: while true {
	switch iterateNode {
	case .null:
		break MainLoop
	case .next(let value, let next):
		print(value)
		iterateNode = next
	}
}
