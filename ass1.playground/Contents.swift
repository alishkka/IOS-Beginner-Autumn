import UIKit

let firstName: String = "Alinur"
let lastName: String = "Anatolyev"
let birthYear: Int = 2005
let currentYear: Int = 2025
let age: Int = currentYear - birthYear
let univer: String = "KBTU"

var isStudent: Bool = true
let height: Double = 1.83

let hobby: String = "Coding"
let numberOfHobbies: Int = 2
let favoriteNumber: Int = 13
var isHobbyCreative: Bool = Bool.random()


var lifeStory = "My name is \(firstName) \(lastName). I'am \(age) years old,  I was born in \(birthYear). I'am a student \(isStudent), of university \(univer). My height is \(height). My favorite hobby is \(hobby), in general i have \(numberOfHobbies) hobbies. My favorite number \(favoriteNumber). Is my hobbies creative? - \(isHobbyCreative) "

let futureGoals: String = "I want to become a IOS developer☺️ "
print(lifeStory, futureGoals)

