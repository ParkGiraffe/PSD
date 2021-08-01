//: ## Functions and Closures
//:
//: Use `func` to declare a function. Call a function by following its name with a list of arguments in parentheses. Use `->` to separate the parameter names and types from the function’s return type.
//:
// 'func' 키워드를 통해 함수를 선언하고, 파라미터와 파라미터의 데이터 타입을 설정한다.
// -> 이후에는 리턴 값의 데이터 타입을 설정하고 함수 구문을 parentheses로 감싼다
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

func greet1(person: String, lunch: String) -> String {
    return "Hello \(person), today's lunch special is \(lunch)."
}
greet1(person: "Bob", lunch: "Beef Steak")
//: - Experiment:
//: Remove the `day` parameter. Add a parameter to include today’s lunch special in the greeting.
//:
//: By default, functions use their parameter names as labels for their arguments. Write a custom argument label before the parameter name, or write `_` to use no argument label.
//:
// 일반적으로 함수는 argument label을 이용해서 값을 받아온다.
// 그리고 함수 내에서 argumnet를 parameter label로 치완하여 사용한다.
// argument label을 따로 붙이고 싶지 않으면 '_' 를 사용한다.


func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")
// greet("John", "Saturday") - error 발생. argument label이 지정된 경우, 함수를 사용할 때 argument label을 꼭 써줘야 한다.

//: Use a tuple to make a compound value—for example, to return multiple values from a function. The elements of a tuple can be referred to either by name or by number.
//:
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) { // tuple을 불러올 때 자료형에 []를 묶어서 불러옴.
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.0) // min
print(statistics.1) // sum
print(statistics.2) // max

// tuple의 요소는, 그 이름 또는 그 순서 referred 함으로써 불러올 수 있다.



//: Functions can be nested. Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that’s long or complex.
//:
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()
// add() - error : 함수 내에 내장된 함수를 그냥 밖에서 사용할 수는 없다. 무조건 사용된 함수 내에서만 사용!

//: Functions are a first-class type. This means that a function can return another function as its value.
//:
// 함수는 first class type으로 함수를 리턴 값으로 줄 수 있다.
// 함수로 된 리턴 값의 데이터 타입은 아래와 같이 쓴다.
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7) // makeIncrementer() 안에 있는 addOne 함수가 사용된 것을 알 수 있다.
// incrementer : 증분기, 자동적으로 하나 또는 지정된 값을 더해주는 장치.

//: A function can take another function as one of its arguments.
//:
// 함수는 함수를 arguments로 받아올 수 있다.
// 받아오는 함수의 자료형은 아래처럼 적는다.
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) { // 리스트 값 중 condition에 하나라도 참이면 참.
            return true
        }
    }
    return false // 모두 거짓이면 거짓.
}
func lessThanTen(number: Int) -> Bool {
    return number < 8
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

//: Functions are actually a special case of closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it’s executed—you saw an example of this already with nested functions. You can write a closure without a name by surrounding code with braces (`{}`). Use `in` to separate the arguments and return type from the body.
//:
numbers.map({ (number: Int) -> Int in // anonymous function과 유사해보임. (number) -> {let result /n result = number * 3}
    let result = 3 * number
    return result
})

print(numbers) // 위에서 map한 걸 다시 저장하지 않느다면, 값은 소멸하고 원래 값만 남아있다.

numbers.map({ (number: Int) -> Int in
    let result = number * 0
    return result
})

//: - Experiment:
//: Rewrite the closure to return zero for all odd numbers.
//:
//: You have several options for writing closures more concisely. When a closure’s type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. Single statement closures implicitly return the value of their only statement.
//:
// concisely : 간결하게
// 자료형이 이미 정해진 경우에는 생략이 가능하다.
// 한 줄 closure일 경우, 암시적으로 그 한 줄을 return 값으로 한다. 즉, return을 따로 지정해줄 필요가 없다.
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

//: You can refer to parameters by number instead of by name—this approach is especially useful in very short closures. A closure passed as the last argument to a function can appear immediately after the parentheses. When a closure is the only argument to a function, you can omit the parentheses entirely.
//:
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)



// stackoverflow 추가문 ******
let ints = [4, 6, 8, 1, 3]

// 완전한 문장
func sortBackwards(val1: Int, val2: Int) -> Bool {
   print("val1: \(val1) - val2: \(val2)" )
   return val1 > val2
}
var sortedInts = ints.sorted(by: sortBackwards)

// +함수명 생략
ints.sorted{(val1: Int, val2: Int) -> Bool in
   return val1 > val2
}

// +자료형 생략
ints.sorted{val1, val2 in
   return val1 > val2
}

// +single statement
var sortedInts2 = ints.sorted{val1, val2 in val1 > val2}
print(sortedInts2)

// swift automatically provides shorthand argument names to inline closures, which can be used to refer to the values of the closure’s arguments by the names $0, $1, $2, and so on.
// so, in example, val1 can be replaced by $0 and val2 can be replaced by $2
// 따라서 위의 내용이 적용된다.
print(numbers.sorted{$0 > $1})

//: [Previous](@previous) | [Next](@next)
