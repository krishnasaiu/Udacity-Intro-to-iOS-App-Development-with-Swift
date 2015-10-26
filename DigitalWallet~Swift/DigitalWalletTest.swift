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
var txtDate = NSDate()
flag = wallet.pay("Airtel", txDate, 455)
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
print("Expected: 585 - Actual: \(availableBalance)")

txDate = NSDate();
flag = wallet.pay("Uber", txDate, 280.50);
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
print("Expected: 324.50 - Actual: \(availableBalance)")

txDate = NSDate()
flag = wallet.pay("Cream Stone", txDate, 680)
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
print("Expected: 324.50 - Actual: \(availableBalance)")

wallet.addMoney(500);
print("You have \(availableBalance) in your wallet")
print("Expected: 324.50 - Actual: \(availableBalance)")

wallet.addMoney(500)
/*
*  Check the balance in wallet after first transaction
*  Prev balance = 324.50
*  Add 500, so balance + deposit = 324.50 + 500 = 824.50
*/
vailableBalance = wallet.getBalance()
print("You have \(availableBalance) in your wallet")
print("Expected: 824.50 - Actual: \(availableBalance)")

txDate = NSDate();
flag = wallet.pay("Cream Stone", txDate, 680);
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
print("Expected: 824.50 - Actual: \(availableBalance)")

/*
* Expected Output:

*/
wallet.getStatement();
