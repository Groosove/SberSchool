import UIKit

struct CalculatingError: Error {
	var localizedDescription: String
}


func monthsToSave(on cost: Double, salary: Double) throws -> Double {
	if salary <= 0 {
		let error = CalculatingError(localizedDescription: "Friend find a job")
		throw error
	}
	return cost / salary
}

do {
	let bitcoin = try monthsToSave(on: 6800, salary: 12)
	print(bitcoin)
} catch let error {
	print("\(error.localizedDescription)")

}
