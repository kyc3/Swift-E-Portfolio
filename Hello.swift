//
//  Hello.swift
//  
//
//  Created by Yannick Winter on 29.05.16.
//
//

import Foundation

// EXPLICIT VS. INFERRED TYPING

let explicit: Int = 42
let inferred = 42

// VARIABLES VS. CONSTANTS

let constant1 = 1
let constant2 = 2
let constant3 = 3

var total = constant1 + constant2 + constant3
total += 1
print(total)

var t = 0
var i = 0.0
while i<20.0 {
    let y = sin(i)
    i += 0.1
}

// OPTIONALS

var testString: String?

if let string = testString {
    print(string)
}
else {
    print("Optional was nil")
}

testString = "Now it's not nil"

if let string = testString {
    print(string)
}
else {
    print("Optional was nil")
}

// BASIC TYPES AND CONTROL FLOW

// floats and doubles
let double = 19.99
let float: Float = 19.99

// bools
let bool1 = true
let bool2: Bool = false

// strings
let string1 = "TINF14B2"
let string2: String = "Not TINF14B2"

// IF-STATEMENTS AND STRING INTERPOLATION

if bool1 {
    print("\(string1)")
} else {
    print("\(string2)")
}

// ARRAYS AND FOR LOOPS

let inferredArray = [0.15, 0.18, 0.20]
let possibleTipsExplicit: [Double] = []

for possibleTip in inferredArray {
    print("\(possibleTip)")
}

// non-inclusive range operator
for i in 0..<inferredArray.count {
    print("\(i)")
}

// UNNAMED VARIABLE _ (Underscore)

let array = ["a","b","c","d","e"]
for _ in array {
    print("hello")
}


// TUPLES

var result = (200, "OK", true)
print(result.1) // Prints "OK"

var result2 = (code: 200, name: "OK", hasBody: true)
print(result2.name) // Prints "OK"
print(result2.1) // Prints "OK"


// CLASSES AND METHODS

class SomeClass {
    
    // class properties
    let a: Double
    let b: Double
    let c: Double
    
    init(a: Double, b: Double) {
        self.a = a
        self.b = b
        c = a / (b + 1)
    }
    
    func doPrint() {
        print("\(a), \(b), \(c)")
    }
    
}

let object = SomeClass(a: 33.25, b: 0.06)
object.doPrint()


// GETTERS AND SETTERS

class GetterAndSetter {
    
    var x = 10
    
    var xTimesTwo:Int {
        set {
            x = newValue/2
        }
        get {
            return x*2
        }
    }
    
}

let gas = GetterAndSetter()
print(gas.x)
print(gas.xTimesTwo)
gas.x = 15
print(gas.xTimesTwo)


// STATIC METHODS

class Static {
    
    static func test() {
        print("Static!")
    }
    
}

var stati = Static()
Static.test()


// CLOSURES

func run(str: String, function: () -> Void) {
    function()
}

run("some string", function: {
    print("called by closure")
})

run("some string") {
    print("called by closure")
}

// PROTOCOLS

protocol Animal {
    var name: String { get }
    
    var canFly: Bool { get }
    var canSwim: Bool { get }
    var canRun: Bool { get }
    
    func saySomething()
}

protocol Bird: Animal {
    func fly()
}

extension Bird {
    var canFly: Bool {
        return true
    }
    var canSwim: Bool {
        return false
    }
    var canRun: Bool {
        return false
    }
}

class Mockingbird: Bird {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func saySomething() {
        print("\(self.name) says: 🎧")
    }
    func fly() {
        print("I'm flying!")
    }
}


protocol Fish: Animal {
    func swim()
}

extension Fish {
    var canFly: Bool {
        return false
    }
    var canSwim: Bool {
        return true
    }
    var canRun: Bool {
        return false
    }
}

class Tuna: Fish {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func saySomething() {
        print("\(self.name): Blub")
    }
    
    func swim() {
        print("I'm swimming")
    }
}


let bird1 = Mockingbird(name: "Eminem")
print(bird1.canFly)
print(bird1.canRun)
bird1.saySomething()
bird1.fly()

let tuna1 = Tuna(name: "Tuner")
print(tuna1.canFly)
print(tuna1.canSwim)
tuna1.saySomething()
tuna1.swim()

func giveAnimal(animal: Animal) {
    animal.saySomething()
    if animal.canFly {
        let bird = animal as! Bird
        bird.fly()
    }
    if animal.canSwim {
        let fish = animal as! Fish
        fish.swim()
    }
}

giveAnimal(bird1)
giveAnimal(tuna1)