import Foundation

func isPrime(_ number: Int) -> Bool{
    var primeOrNot = false
    if number<=1{
        return false
    }
    if number<=3{
        return true
    }
        
        for i in 2...Int(sqrt(Double(number)) ){
        if(number % i == 0)
        {
            return false
        }
    }
    return true
}

func celsiusToFahrenheit(_ c: Double) -> Double {
    return (c * 9/5) + 32
}

func celsiusToKelvin(_ c: Double) -> Double {
    return c + 273.15
}

func fahrenheitToCelsius(_ f: Double) -> Double {
    return (f - 32) * 5/9
}

func fahrenheitToKelvin(_ f: Double) -> Double {
    return (f - 32) * 5/9 + 273.15
}

func kelvinToCelsius(_ k: Double) -> Double {
    return k - 273.15
}

func kelvinToFahrenheit(_ k: Double) -> Double {
    return (k - 273.15) * 9/5 + 32
}

func addToShopList(to shoppingCard: inout [String],_ item: String){
    shoppingCard.append(item)
}

func deleteElFromList(to shoppingCard: inout [String],_ item: Int)
{
    shoppingCard.remove(at: item-1)
}

func printItems(_ list: [String])
{
    if(list.isEmpty)
    {
        print("Card is empty")
    }
    else{
        for i in 0...list.count-1{
            print(i+1,".",list[i],separator: "")
        }
    }
}


//Task1
/*
for i in 1...100{
    print(i,"- ")
    if(i % 5 == 0 && i % 3 == 0){
        print("FizzBuzz")
    }
    else if(i % 3 == 0)
    {
        print("Fizz")
    }
    else if(i % 5 == 0){
        print("Bazz")
    }
}
 */

//Task2
/*
for i in 1...100{
    print(i,"-",isPrime(i))
}*/

//Task 3
/*
var unit = "C"
var temp: Double = 100

if unit == "C" {
    print("\(temp)°C = \(celsiusToFahrenheit(temp))°F")
    print("\(temp)°C = \(celsiusToKelvin(temp))K")
} else if unit == "F" {
    print("\(temp)°F = \(fahrenheitToCelsius(temp))°C")
    print("\(temp)°F = \(fahrenheitToKelvin(temp))K")
} else if unit == "K" {
    print("\(temp)K = \(kelvinToCelsius(temp))°C")
    print("\(temp)K = \(kelvinToFahrenheit(temp))°F")
} else {
    print("Ошибка: введите только C, F или K")
}*/

//Task 4
/*var workingOrNot: Bool = false
var shoppingCard: [String] = []
while(!workingOrNot)
{
    print("Choose the operation you want to do:")
    print("1.Add Element to your Shopping Card")
    print("2.Delete item from Shopping Card")
    print("3.Show current shoping card")
    print("4.Do you want to quit?")
    
    var numOfTheOp = readLine()
    
    switch numOfTheOp{
    case "1":
        print("Write the product that you want to add")
        var product = readLine() ?? "unknown item"
        addToShopList(to: &shoppingCard, product)
        print("Succesfully Added")
    case "2":
        print("Input which one you want to delete")
        var numOfTheItem = Int(readLine()!)!
        deleteElFromList(to: &shoppingCard,numOfTheItem)
    case "3":
        printItems(shoppingCard)
    case "4":
        workingOrNot = true
    default:
        print("Wrong num")
    }
}*/

//TASK 5
/*print("Enter a sentence:")
if let input = readLine() {
    let cleaned = input.lowercased().components(separatedBy: CharacterSet.punctuationCharacters).joined()
    let words = cleaned.split(separator: " ").map { String($0) }

    var frequency: [String: Int] = [:]

    for word in words {
        frequency[word, default: 0] += 1
    }

    print("\nWord Frequencies:")
    for (word, count) in frequency {
        print("\(word): \(count)")
    }
}*/

//TASK 6
/*func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 { return [] }
    if n == 1 { return [0] }
    if n == 2 { return [0, 1] }

    var sequence = [0, 1]
    for i in 2..<n {
        sequence.append(sequence[i - 1] + sequence[i - 2])
    }
    return sequence
}

// Example:
print("Enter n for Fibonacci sequence:")
if let input = readLine(), let n = Int(input) {
    print("Fibonacci sequence:", fibonacci(n))
}*/

//TASK 7
/*var students: [String: Double] = [:]
 
 print("Enter number of students:")
 if let input = readLine(), let count = Int(input) {
     for _ in 1...count {
         print("Enter student name:")
         let name = readLine() ?? "Unknown"

         print("Enter \(name)'s score:")
         if let scoreInput = readLine(), let score = Double(scoreInput) {
             students[name] = score
         }
     }

     if !students.isEmpty {
         let scores = Array(students.values)
         let average = scores.reduce(0, +) / Double(scores.count)
         let highest = scores.max()!
         let lowest = scores.min()!

         print("\nAverage score: \(average)")
         print("Highest score: \(highest)")
         print("Lowest score: \(lowest)")

         print("\nStudent Results:")
         for (name, score) in students {
             let status = score >= average ? "Above average" : "Below average"
             print("\(name): \(score) — \(status)")
         }
     }
 }*/

//TASK 8
/*func isPalindrome(_ text: String) -> Bool {
 let filtered = text.lowercased().filter { $0.isLetter || $0.isNumber }
 return filtered == filtered.reversed()
}

// Example:
print("Enter text to check palindrome:")
if let input = readLine() {
 if isPalindrome(input) {
     print("✅ It's a palindrome!")
 } else {
     print("❌ Not a palindrome.")
 }
}*/

//TASK 9
/*func add(_ a: Double, _ b: Double) -> Double { a + b }
 func subtract(_ a: Double, _ b: Double) -> Double { a - b }
 func multiply(_ a: Double, _ b: Double) -> Double { a * b }
 func divide(_ a: Double, _ b: Double) -> Double? { b == 0 ? nil : a / b }

 while true {
     print("\nEnter first number:")
     guard let a = Double(readLine() ?? "") else { print("Invalid input"); continue }

     print("Enter second number:")
     guard let b = Double(readLine() ?? "") else { print("Invalid input"); continue }

     print("Choose operation (+, -, *, /) or type 'exit':")
     let op = readLine() ?? ""

     if op.lowercased() == "exit" {
         print("Exiting calculator...")
         break
     }

     var result: Double?

     switch op {
     case "+": result = add(a, b)
     case "-": result = subtract(a, b)
     case "*": result = multiply(a, b)
     case "/": result = divide(a, b)
     default:
         print("Unknown operation.")
         continue
     }

     if let res = result {
         print("Result: \(res)")
     } else {
         print("Error: Division by zero.")
     }
 }*/

//TASK 10
/*func hasUniqueCharacters(_ text: String) -> Bool {
 var seen: Set<Character> = []
 for char in text {
     if seen.contains(char) {
         return false
     }
     seen.insert(char)
 }
 return true
}

// Example:
print("Enter text to check unique characters:")
if let input = readLine() {
 print(hasUniqueCharacters(input)
       ? "✅ All characters are unique."
       : "❌ Some characters are repeated.")
}*/
