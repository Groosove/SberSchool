import UIKit


struct CalculationError: Error {
	var localizedDescription: String
}


enum OtherError: Error {
	case something(message: String)
}


func monthsToSave(on cost: Double, salary: Double) throws -> Double {
	if salary <= 0 {
		let error = CalculationError(localizedDescription: "friend find a job")
		throw error
	}
	
	return cost / salary
}

// do - try - catch
do {
	let bitcoin = try monthsToSave(on: 6800, salary: 0)
	print(bitcoin)
} catch let error as CalculationError {
	print("calc error: \(error.localizedDescription)")
	//		throw error - можно снова бросить ошибку
} catch OtherError.something(let message) {
	print("error with message: \(message)")
} catch {
	print("some other error")
}

// try?
// мы получаем значение или nil, если была ошибка
let dogkoin = try? monthsToSave(on: 6800, salary: 123)
if let dogkoin = dogkoin {
	print(String(format: "%.2f", dogkoin)) // форматирует до двух знаков после запятой
} else {
	print("failed calculating dogkoin")
}

// try!
// мы крашим приложение, если была ошибка
let catkoin = try! monthsToSave(on: 6800, salary: 123)
print(catkoin)

