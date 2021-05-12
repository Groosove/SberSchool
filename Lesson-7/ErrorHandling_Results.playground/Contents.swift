import UIKit


// кол-во месяцев
// ошибка
// кол-во месяцев, но не стоит копить

struct CalculationEror: Error {
	var localizedDescription: String
}


enum CalculationResult<Value, FailureValue> {
	case success(numberOfMonth: Value)
	case failure(error: FailureValue)
	case warning(numberOfMonth: Value, message: String)
}

typealias Money = Double
typealias Short = CalculationResult<Double, CalculationEror>

func monthsToSave(on cost: Double, salary: Double) -> Short {
	if salary <= 0 {
		let error = CalculationEror(localizedDescription: "friend find a job")
		return .failure(error: error)
	}
	
	let time = cost / salary
	
	if time > 12 {
		return .warning(numberOfMonth: 12, message: "it will take tool long, don't do it")
	}
	
	return .success(numberOfMonth: time)
}


func howLongWillItTake(toBuy: Double) {
	
	let bitcoin = monthsToSave(on: 6800, salary: 12)
	
	switch bitcoin {
	case .success(let months):
		print(months)
	case .failure(let error):
		print(error.localizedDescription)
	case .warning(numberOfMonth: let numberOfMonth, message: let message):
		print(message, numberOfMonth)
		
	}
}







