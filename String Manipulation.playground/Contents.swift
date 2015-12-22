//: Playground - noun: a place where people can play

import UIKit

var str = "Hello"

var newStr = str + " Kittu"

for character in newStr.characters {
    print(character)
}

var newTypeStr = NSString(string: newStr)

newTypeStr.substringToIndex(5)

newTypeStr.substringFromIndex(6)

newTypeStr.substringWithRange(NSRange(location: 3, length: 5))

newTypeStr.containsString("Hello")

newTypeStr.componentsSeparatedByString(" ")

newTypeStr.uppercaseString

newTypeStr.lowercaseString