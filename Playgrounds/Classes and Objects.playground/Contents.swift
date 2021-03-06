//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Person {
    var firstName: String
    var surName: String
    
    init (firstName: String, surName: String) {
        self.firstName = firstName
        self.surName = surName
    }
    
    func sayHello() {
        println("Hello, my name is \(firstName) \(surName)")
    }
    
    class func sayHello() {
        println("Hello")
    }
}

let captain = Person(firstName: "Jack", surName: "Sparrow")
captain.sayHello()
Person.sayHello()
