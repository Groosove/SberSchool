import Foundation

/*
** Task-1
** Релизовать COW
*/

private final class Refer<T> {
	var value: T
	init (_ value: T) {
		self.value = value
	}
}

struct Box<T> {
	private var ref: Refer<T>
	
	init (_ value: T) {
		self.ref = Refer(value)
	}
	var value: T {
		get { ref.value }
		set {
			if !isKnownUniquelyReferenced(&ref) {
				ref = Refer(newValue)
				return
			}
			ref.value = newValue
		}
	}
	mutating func refAddress() { print(Unmanaged.passUnretained(ref).toOpaque()) }
}

var a = Box(5)
var b = a

a.refAddress()
b.refAddress()
b.value = 20
print("")
a.refAddress()
b.refAddress()
