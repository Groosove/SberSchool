import Foundation

/*
** Task-1
** Релизовать COW
*/

final class Refer<T> {
	var value: T
	init (_ value: T) {
		self.value = value
	}
}

struct Box<T> {
	var ref: Refer<T>
	
	init (_ value: T) {
		self.ref = Refer(value)
	}
	var value: T {
		get { ref.value }
		set {
			if !isKnownUniquelyReferenced(&ref) {
				ref = Refer(newValue)
			}
			else {
				ref.value = newValue
			}
		}
	}
}

var a = Box(5)
var b = a

print(Unmanaged.passUnretained(a.ref).toOpaque())
print(Unmanaged.passUnretained(b.ref).toOpaque())
b.value = 20
print("")
print(Unmanaged.passUnretained(a.ref).toOpaque())
print(Unmanaged.passUnretained(b.ref).toOpaque())
