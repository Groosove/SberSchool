import UIKit

class Account {
    var accountName: String
    var balance: Int
    
    init(accountName: String, balance: Int) {
        self.accountName = accountName
        self.balance = balance
    }
}

protocol CommandProtocol {
    func execute()
    var isComplete: Bool { get set }
}

class Deposite: CommandProtocol {
    private var account: Account
    private var amount: Int
    var isComplete = false
    
    init(account: Account, amount: Int) {
        self.account = account
        self.amount = amount
    }
    
    func execute() {
        account.balance += amount
        isComplete = true
    }
}

class Withdraw: CommandProtocol {
    private var account: Account
    private var amount: Int
    var isComplete = false
    
    init(account: Account, amount: Int) {
        self.account = account
        self.amount = amount
    }
    
    func execute() {
        if account.balance < amount { return }
        account.balance -= amount
        isComplete = true
    }
}


struct TransactionManager {
    private var transactions: [CommandProtocol] = []
    var pendingTransactions: [CommandProtocol] { return self.transactions.filter { !$0.isComplete } }
    mutating func addTransaction(command: CommandProtocol) {
        transactions.append(command)
    }
    
    func processingTransactions() {
        transactions.filter { $0.isComplete == false }.forEach { $0.execute() }
    }
}

let account = Account(accountName: "MyBill", balance: 1000)

var transactionManager = TransactionManager()
transactionManager.addTransaction(command: Deposite(account: account, amount: 100))
transactionManager.addTransaction(command: Withdraw(account: account, amount: 100))
transactionManager.addTransaction(command: Withdraw(account: account, amount: 100))
transactionManager.addTransaction(command: Withdraw(account: account, amount: 100))
transactionManager.pendingTransactions
account.balance
transactionManager.processingTransactions()
transactionManager.pendingTransactions
account.balance
