import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

/*
** Task-1
** Реализовать все виды диспетчеризации
*/

//MARK: Direct Dispatch
struct SomeStruct {
	func sayHello(name: String = "Anonymous") {
		print("Hello, \(name)");
	}
}
var structObj = SomeStruct()
structObj.sayHello()

//MARK: Witness Dispatch
protocol SomeProtocol {
	func sayHello(name: String)
}

struct NewStruct: SomeProtocol {
	func sayHello(name: String = "Anonymous") {
		print("Hello, \(name)");
	}
}
var newStructObj = NewStruct()
newStructObj.sayHello(name: "Nikita")

//MARK: Virtual Dispatch
class SomeClass {
	func sayHello(name: String = "Anonymous") {
		print("Hello, \(name)");
	}
}
var classObj = SomeClass()
classObj.sayHello(name: "Ivan")

//MARK: Message Dispatch
class ObjClass {
	@objc dynamic func sayHello(name: String = "Anonymous") {
		print("Hello, \(name)");
	}
}
var objClass = ObjClass()
objClass.sayHello()
