import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

protocol Sayble {
	func say()
}

extension Sayble {
	func say() {
		print("Sayble.say()")
	}
}

class Human: Sayble {
	func say() {
		print("Human.say()")
	}
}

class Animal {}

extension Animal: Sayble {
	func say() {
		print("Animal.say()")
	}
}

let human: Sayble = Human()
let animal: Sayble = Animal()

human.say()
animal.say()
