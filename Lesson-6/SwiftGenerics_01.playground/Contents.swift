import UIKit

// MARK: - Задача 1 "Сделать так, чтобы закомментированный код работал"

extension String: AdditiveArithmetic {
	public static func -= (lhs: inout String, rhs: String) {}
	public static func - (lhs: String, rhs: String) -> String { "0" }
	public static var zero: String { return "0" }
}

func sumTwoValues<T:AdditiveArithmetic>(_ a: T, _ b: T) -> T {
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
