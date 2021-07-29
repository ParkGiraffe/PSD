//: # A Swift Tour
//:
//: Tradition suggests that the first program in a new language should print the words “Hello, world!” on the screen. In Swift, this can be done in a single line:
//:
print("Hello, world!")

//: If you have written code in C or Objective-C, this syntax looks familiar to you—in Swift, this line of code is a complete program. You don’t need to import a separate library for functionality like input/output or string handling. Code written at global scope is used as the entry point for the program, so you don’t need a `main()` function. You also don’t need to write semicolons at the end of every statement.
//:
//: This tour gives you enough information to start writing code in Swift by showing you how to accomplish a variety of programming tasks. Don’t worry if you don’t understand something—everything introduced in this tour is explained in detail in the rest of this book.
//:
//: ## Simple Values
//:
//: Use `let` to make a constant and `var` to make a variable. The value of a constant doesn’t need to be known at compile time, but you must assign it a value exactly once. This means you can use constants to name a value that you determine once but use in many places.
//:
var myVariable = 42
myVariable = 50
let myConstant = 42

// let은 상수, var은 변수이다
let thisIsConstant = 30
//thisIsConstant = 45 // error
var thisIsVariable = 50
thisIsVariable = 70
//: A constant or variable must have the same type as the value you want to assign to it. However, you don’t always have to write the type explicitly. Providing a value when you create a constant or variable lets the compiler infer its type. In the example above, the compiler infers that `myVariable` is an integer because its initial value is an integer.
//:
//: If the initial value doesn’t provide enough information (or if isn’t an initial value), specify the type by writing it after the variable, separated by a colon.
//:
// swift 엔진 자체에서 탸입을 추론하기 때문에, 따로 타입을 명시하지 않아도 자동으로 인식한다.
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 65.8

var varInteger = 70
//varInteger = 70.5 // error -  변수를 재설정할 때, data type이 같아야만 한다.


//: - Experiment:
//: Create a constant with an explicit type of `Float` and a value of `4`.
//:
//: Values are never implicitly converted to another type. If you need to convert a value to a different type, explicitly make an instance of the desired type.
//:

let label = "The width is "
let width = 94
let widthLabel = label + String(width)
// Int type과 String type 간에는 +operator가 작동하지 않는다.

let one = 1
let twoPointOne = 2.1
//let plusThese = one + twoPointOne // Int type + Double type도 불가능.
//: - Experiment:
//: Try removing the conversion to `String` from the last line. What error do you get?
//:
//: There’s an even simpler way to include values in strings: Write the value in parentheses, and write a backslash (`\`) before the parentheses. For example:
//:
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
// \(value) 형식을 이용해서 String type 안에 값을 자동으로 넣을 수 있다.
//: - Experiment:
//: Use `\()` to include a floating-point calculation in a string and to include someone’s name in a greeting.
//:
//: Use three double quotation marks (`"""`) for strings that take up multiple lines. Indentation at the start of each quoted line is removed, as long as it matches the indentation of the closing quotation marks. For example:
//:
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""

let quotation2 = """
멀티라인 String일 경우
자동으로 들여쓰기가 제거 된다.
"""

//: Create arrays and dictionaries using brackets (`[]`), and access their elements by writing the index or key in brackets. A comma is allowed after the last element.
//:
var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water" // 기존 1번에 있던 데이터는 사라지고, 새로운 값으로 재설정.
shoppingList

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
 ]
occupations["Jayne"] = "Public Relations" // 추가됨.
occupations // dictionary는 키값으로 불리기 때문에, 따로 순서의 중요도가 존재하지 않는 것으로 보인다.
//: Arrays automatically grow as you add elements.
//:
shoppingList.append("blue paint") // JS의 push처럼 뒤에 값을 추가.
print(shoppingList)

//: To create an empty array or dictionary, use the initializer syntax.
//:
let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]

//: If type information can be inferred, you can write an empty array as `[]` and an empty dictionary as `[:]`—for example, when you set a new value for a variable or pass an argument to a function.
//:
shoppingList = []
occupations = [:]

//shoppingList.append(9) - error : Stirng타입으로 추론된 상태라서 오류가 뜬다. 현업에서 쓸 때는 타입을 명시해서 쓰는 게 좋을 것으로 보인다.
shoppingList.append("안녕하세요")
shoppingList

//: See [License](License) for this sample's licensing information.
//: 
//: [Next](@next)
