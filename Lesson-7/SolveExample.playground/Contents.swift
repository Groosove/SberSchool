import Foundation

enum CheckExample: Error {
	case invalidExample
	case invalidResult(_ result: Int)
}

func checkTask(example: String) throws -> Result<Int, CheckExample> {
	let arr = example.split(separator: " ")
	
	if arr.count != 5 || (arr[1] != "+" && arr[1] != "-") || arr[3] != "=" {
		throw CheckExample.invalidExample
	}
	if let lhs = Int(arr[0]), let rhs = Int(arr[2]), let resExample = Int(arr[4]) {
		let result = lhs + rhs
		return (result == resExample ) ?
			.success(result) :
			.failure(CheckExample.invalidResult(result))
	}
	throw CheckExample.invalidExample
}

func checkHomework(example: [String]) -> String {
	let exampleCount = example.count
	var invalidExample = String()
	
	if exampleCount == 0 { return "Нет примеров" }
	for onceEx in example {
		do {
			let result = try checkTask(example: onceEx)
			switch result {
				case .success: continue
				case .failure: invalidExample.append(onceEx + "\n")
			}
		} catch { return "Переделывай" }
	}
	if Decimal(invalidExample.count) / Decimal(exampleCount) <= 0.75 {
		return "Молодец"
	}
	return "Делай заново\nВот список невалидных примеров:\n\(invalidExample)"
}

let niceSolution = [
	"1 + 2 = 3",
	"1 + 2 = 3",
	"1 + 2 = 3",
	"1 + 2 = 3",
	"1 + 2 = 3",
	"1 + 2 = 3",
	"1 + 2 = 3",
	"1 + 2 = 3",
	"1 + 2 = 3",
	"1 + 2 = 3"
]

let invalidSolution = [
	"1 + 2 = 3",
	"1 + 2 = 3",
	"1 + 2 = 3",
	"1 + 2 = 3",
	"1 + 2 = 3",
	"1 + 2 = 3",
	"1 + 2 = 2",
	"1 + 2 = 2",
	"1 + 2 = 2",
	"1 + 2 = 2"
]

let invalidExample = [
	"1 + 2 = 3",
	"Wow! Obaldet'"
]

let emptyExample = [String]()

print(checkHomework(example: niceSolution) + "\n")
print(checkHomework(example: invalidSolution))
print(checkHomework(example: invalidExample) + "\n")
print(checkHomework(example: emptyExample))
