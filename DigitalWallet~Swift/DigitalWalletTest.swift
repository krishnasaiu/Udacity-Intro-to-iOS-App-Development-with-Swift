import Foundation

class Transaction {
    private var payee: String
    private var date: NSDate
    private var amount: Double
    private var success: Bool
    
    init(payee: String, date: NSDate, amount: Double){
        self.payee = payee
        self.date = date
        self.amount = amount
        success = false
    }
    
    func setsuccess(success: Bool){
        self.success = success
    }
};

class DigitalWallet{
    private var walletName: String
    private var balance: Double
    private var transactions: [Transaction]
    
    init(walletName: String) {
        self.walletName = walletName
        balance = 0
        transactions = [Transaction]()
    }
    
    func addMoney(money: Double) -> Bool {
        if(money >= 0 && money <= 5000){
            balance += money
            return true
        }
        return false
    }
    
    func getBalance() -> Double {
        return balance
    }
    
    func pay(payee: String, date: NSDate, amount: Double) -> Bool {
        let t = Transaction(payee: payee, date: date, amount: amount)
        if (balance >= amount){
            balance -= amount
            balance += (floor(amount/100))*10
            t.setsuccess(true)
            transactions.append(t)
            return true
        }
        transactions.append(t)
        return false
    }
};

/**
 * A digital wallet is a software application that allows
 * an individual to make online payments.
 *
 * A user can do the following:
 *  - create a new digital wallet
 *  - add money to their wallet
 *  - check balance in wallet
 *  - pay a merchant from their wallet
 *  - earn Rs. 10 for every Rs. 100 spent from the wallet
 *  - see the statement of all the transactions
 */

var flag = false
var availableBalance: Double

/* Create an object of digital wallet for Praveen */
var wallet = DigitalWallet(walletName: "Praveen")

/*
 * Add money to wallet
 * Cannot add less than 0 or more than 5000
 */
flag = wallet.addMoney(1000)
if(flag)
{
  print("Transaction Approved")
}
else
{
  print("Transaction Declined")
}

/*
 *  Check the balance in wallet
 */
availableBalance = wallet.getBalance()

print("You have \(availableBalance) in your wallet")
print("Expected: 1000 - Actual: \(availableBalance)")

/*
 *  Pay a merchant from wallet
 *  Don't approve transaction if balance is less than amount
 */
var txDate = NSDate()
flag = wallet.pay("Airtel", date: txDate, amount: 455)
if(flag)
{
    print("Transaction Approved")
    print("Testcase Passed!")
}
else
{
    print("Transaction Declined")
    print("Testcase Failed!")
}

/*
*  Check the balance in wallet after first transaction
*  Prev balance = 1000
*  Paid 455, so balance - paid = 1000 - 455 = 545
*  Add Rs. 40 for spending 455, so balance 545 + 40 = 585
*/
availableBalance = wallet.getBalance();
print("You have \(availableBalance) in your wallet")
print("Expected: 585.0 - Actual: \(availableBalance)")

txDate = NSDate();
flag = wallet.pay("Uber", date: txDate, amount: 280.50);
if(flag)
{
    print("Transaction Approved")
    print("Testcase Passed!")
}
else
{
    print("Transaction Declined")
    print("Testcase Failed!")
}

/*
*  Check the balance in wallet after first transaction
*  Prev balance = 585
*  Paid 280.50, so balance - paid = 585 - 280.50 = 304.50
*  Add Rs. 20 for spending 280.50, so balance 304.50 + 20 = 324.50
*/
availableBalance = wallet.getBalance();
print("You have \(availableBalance) in your wallet")
print("Expected: 324.5 - Actual: \(availableBalance)")

txDate = NSDate()
flag = wallet.pay("Cream Stone", date: txDate, amount: 680)
if(!flag)
{
    print("Transaction Approved")
    print("Testcase Passed!")
}
else
{
    print("Transaction Declined")
    print("Testcase Failed!")
}

/*
*  Check the balance in wallet after first transaction
*  Prev balance = 585
*  Paid 280.50, so balance - paid = 585 - 280.50 = 304.50
*  Add Rs. 20 for spending 280.50, so balance 304.50 + 20 = 324.50
*/
availableBalance = wallet.getBalance();
print("You have \(availableBalance) in your wallet")
print("Expected: 324.5 - Actual: \(availableBalance)")

wallet.addMoney(500)
/*
*  Check the balance in wallet after first transaction
*  Prev balance = 324.50
*  Add 500, so balance + deposit = 324.50 + 500 = 824.50
*/
availableBalance = wallet.getBalance()
print("You have \(availableBalance) in your wallet")
print("Expected: 824.5 - Actual: \(availableBalance)")

txDate = NSDate();
flag = wallet.pay("Cream Stone", date: txDate, amount: 680);
if(flag)
{
    print("Transaction Approved")
    print("Testcase Passed!")
}
else
{
    print("Transaction Declined")
    print("Testcase Failed!")
}

/*
*  Check the balance in wallet after first transaction
*  Prev balance = 824.50
*  Paid 680, so balance - paid = 824.50 - 680 = 144.50
*  Add Rs. 60 for spending 680, so balance 144.50 + 60 = 204.50
*/
availableBalance = wallet.getBalance();
print("You have \(availableBalance) in your wallet")
print("Expected: 204.5 - Actual: \(availableBalance)")

/*
* Expected Output:

*/
//wallet.getStatement();
