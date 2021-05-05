import UIKit

// MARK: - Задача 1 "Сделать так, чтобы закомментированный код работал"

protocol AnyObjectArithmetic {
	static func+ (lhs: Self, rhs: Self) -> Self
}

extension Double: AnyObjectArithmetic {}
extension String: AnyObjectArithmetic {}
extension Int: AnyObjectArithmetic {}
extension Float: AnyObjectArithmetic {}

func sumTwoValues<T>(_ a: T, _ b: T) -> T where T: AnyObjectArithmetic {
	let result = a + b
	return result
}

let a = 25.0
let b = 34.0

let resultDouble = sumTwoValues(a, b)
print(resultDouble)

let c = "ABC"
let d = "DEF"

let resultString = sumTwoValues(c, d)
print(resultString)
