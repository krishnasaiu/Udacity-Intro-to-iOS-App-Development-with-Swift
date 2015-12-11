//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var name:String = "Krishna"

print("Hello, \(name)")

var int:Int = 9

int *= 2

int /= 4

var anotherInt:Int = 7

print(int * anotherInt)

print("value of int is \(int)")

var n:Double = 8.4

print(n * Double(int))

var isMale:Bool = true

var array = [17, 25, 13, 47]

print(array[3])

print(array.count)

array.append(56)

array.removeAtIndex(3)

print(array)

array.sort()

var menu = ["sandwich" : 100, "pizza": 200, "biryani": 200]

var total:Int = 0

for (item, price) in menu {
    total += price
}

print(total)

var uname = "krishna"

var pass = "password"

if uname == "krishna" && pass == "password" {
    print("You are in")
} else {
    if uname != "krishna" && pass != "password" {
        print("Both username and password are wrong")
    } else if uname != "krishna" {
        print("username is wrong")
    } else {
        print("password is wrong")
    }
}

for var i = 2; i <= 20; i += 2 {
    print(i)
}

var arr:[Int] = [2, 4, 6, 8, 10]

for var index = 0; index < arr.count; index++ {
    arr[index] /= 2
}

print(arr)

var i = 0

while i++ < 10 {
    print(i * 5)
}

arr = [1, 2, 3, 4, 5, 6 ,7]

i = 0
while i < arr.count {
    arr[i++]--
}

print(arr)

func isPrime(n: Double) -> Bool {
    if n == 1 || n == 0{
            return false
    }
    for var i:Double = 2; i <= sqrt(n); i++ {
        if n % i == 0 {
            return false
        }
    }
    return true
}

print(isPrime(1))


