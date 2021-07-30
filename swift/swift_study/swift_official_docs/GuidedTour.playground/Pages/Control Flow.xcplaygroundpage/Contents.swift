//: ## Control Flow
//:
//: Use `if` and `switch` to make conditionals, and use `for`-`in`, `while`, and `repeat`-`while` to make loops. Parentheses around the condition or loop variable are optional. Braces around the body are required.
//:
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

//: In an `if` statement, the conditional must be a Boolean expression—this means that code such as `if score { ... }` is an error, not an implicit comparison to zero.
//:
//: You can use `if` and `let` together to work with values that might be missing. These values are represented as optionals. An optional value either contains a value or contains `nil` to indicate that a value is missing. Write a question mark (`?`) after the type of a value to mark the value as optional.
//:
// optional value는 ?를 이용해서 사용한다. 값이 있을 수도 있고 없을 수도 있음을 의미한다.

var optionalString: String? = "Hello"
print(optionalString == nil) // false
var optionalString2: String? // nil
print(optionalString2 == nil) // true

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName { // if 다음에 let을 쓰고, 옵셔널로 선언된 변수를 value로 선언한다.
    greeting = "Hello, \(name)"
}

var optionalName2: String?
if let name = optionalName2 { // if 문에서 optional을 쓸 때, 값이 nil일 경우 false로 인식하고 스킵한다.
    greeting = "Hello, \(name)"
} else {
    greeting = "Your name is empty" // nil일 경우 else문이 실행된다.
}

//if let name: String? = optionalName3 {
//    greeting = "Hello, \(name)"
//}
// if 문에서 옵셔널 선언은 불가능



//: - Experiment:
//: Change `optionalName` to `nil`. What greeting do you get? Add an `else` clause that sets a different greeting if `optionalName` is `nil`.
//:
//: If the optional value is `nil`, the conditional is `false` and the code in braces is skipped. Otherwise, the optional value is unwrapped and assigned to the constant after `let`, which makes the unwrapped value available inside the block of code.
//:
//: Another way to handle optional values is to provide a default value using the `??` operator. If the optional value is missing, the default value is used instead.
//:
let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"
let informalGreeting2 = "Hi \(nickname ?? "yosep Park")"
// '??'를 사용해서, 왼 쪽에 있는 옵셔널 값이 nil경우 오른쪽에 선언 된 값이 default값으로 사용된다.

let optionNilString: String? = "hello"
//let infromalGreeting3 = "Hi \(nickname ?? optionNilString)" - 둘 다 옵셔널로 사용할 경우 경고창이 뜨고 올바른 값이 뜨지 않는다. "Optional("hello")" 라고 표시된다.

//: Switches support any kind of data and a wide variety of comparison operations—they aren’t limited to integers and tests for equality.
//:
var vegetable = "red pepper"
vegetable = "celery"
switch vegetable { // 해당 값에서
    case "celery": // 같은 case일 경우, 그 안의 구문이 실행된다.
        print("Add some raisins and make ants on a log.")
    case "cucumber", "watercress":
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"): // 단어에 "pepper"가 들어간다면 x로 받는다는 것 같다.
        print("Is it a spicy \(x)?")
    default: // Switch 구문에서 default 값이 없으면 오류가 발생한다.
        print("Everything tastes good in soup.")
}

//: - Experiment:
//: Try removing the default case. What error do you get?
//:
//: Notice how `let` can be used in a pattern to assign the value that matched the pattern to a constant.
//:
//: After executing the code inside the switch case that matched, the program exits from the switch statement. Execution doesn’t continue to the next case, so you don’t need to explicitly break out of the switch at the end of each case’s code.
//:
//: You use `for`-`in` to iterate over items in a dictionary by providing a pair of names to use for each key-value pair. Dictionaries are an unordered collection, so their keys and values are iterated over in an arbitrary order.
//:
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers { // Prime, Fibonacci, Square 과 같은 keys를 제외하고, value만 취급해서 Numbers에 넣은 다음, numbers안의 number를 가지고 최대값 구하기.
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

let interestingNumbers2 = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest2 = 0
for (keysName, numbers) in interestingNumbers2 {
    for number in numbers {
        if number > largest2 {
            largest2 = number
        }
    }
}
print(largest2)
//: - Experiment:
//: Replace the `_` with a variable name, and keep track of which kind of number was the largest.
//:
//: Use `while` to repeat a block of code until a condition changes. The condition of a loop can be at the end instead, ensuring that the loop is run at least once.
//:
var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)
// while을 사용하는 두 가지 구문.
// 참일 때 반복되고, 거짓이 되면 중단.

//: You can keep an index in a loop by using `..<` to make a range of indexes.
//:
var total = 0
for i in 0..<4 { // 0부터 4 이전까지
    total += i
}
print(total)

total = 0
for i in 0...4 {
    total += i
}
print(total)

// 상한 값을 생략하는 범위를 만들려면 '..<'(n보다 작다) 를 사용하고 두 값을 모두 포함하는 범위를 만들려면 '...'(n보다 작거나 같다) 을 사용합니다.
//: Use `..<` to make a range that omits its upper value, and use `...` to make a range that includes both values.
//:


//: [Previous](@previous) | [Next](@next)
