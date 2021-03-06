//
//  MyFirstApp
//
//  Created by 박요셉 on 2021/06/26.
//

import Foundation

// 1. 함수
// func 키워드를 사용한다. '->'를 사용해서 함수의 반환타입을 지정한다.
func hello(name: String, time: Int) -> String {
    var string = ""
    for _ in 0..<time {
        string += "\(name)님 안녕하세요!\n"
    }
    return string
}

// swift는 함수를 호출할 때 파라미터 이름을 같이 써줘야 한다.
hello(name: "박요셉", time: 3)


// 함수를 호출할 때 파라미터 이름과 함수 내부에서 사용하는 파라미터 이름을 다르게 사용하고 싶을 경우
func hello_two (to name: String, numberOfTimes time: Int) {
    for _ in 0..<time {
        print(name)
    }
}

hello_two(to: "박요셉", numberOfTimes: "3") // 이곳에는 to, numberOfTimes를 사용.


// 파라미터 기본값을 설정할 수 있고, 기본값이 설정된 파라미터는 함수 호출 때 생략할 수 있다.
func hello_three (to name: String, numberOfTimes time: Int = 1) {
    for _ in 0..<time {
        print(name)
    }
}

hello_three(to: "박요셉")


// '...'를 사용하면 개수가 정해지지 않은 파라미터(Variadic Parameters)를 받을 수 있다.
// 파이썬으로 따지면 한 번에 list를 받아오는 함수
func sum(_ numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

sum(1, 2, 3, 4, 5) // 15


// 함수 안에 함수를 작성할 수 있다.
func hello_four (name: String, time: Int) {
    func message(name: String) -> String {
        return "\(name)님 안녕하세요!"
    }

    for _ in 0..<time {
        print(message(name: name))
    }
}


// 함수 안에 정의한 함수를 반환할 수도 있다.
// generator의 함수의 반환타입은 (String) -> String이다.
// 즉 'generator'는 '문자열[message]을 받아서 문자열을 반환하는 함수[hello(name) + message]'를 반환하는 함수이다.
func generator_one(message: String) -> (String) -> String {
    func hello(name: String) -> String {
        return name + message
    }
    return hello
}

let hello = generator_one(message: "님 안녕하세요!")
hello("전수열")


// generator 안의 hello 함수가 여러 개의 파라미터를 받는다면?
// (String)->String에서 (String, String) > String으로 바뀌었다. 문자열 두 개를 받아서 문자열을 반환한다는 의미이다.
func generator_two(message: String) -> (String, String) -> String {
    func hello(firstName: String, lastName: String) -> String {
        return lastName + firstName + message
    }
    return hello
}

let hello = generator_two(message: "님 안녕하세요!")
hello("수열", "전")



// 2. 클로져(closure) : 중괄호로 감싸진 '실행 가능한 코드 블럭'
// 이중 함수, 특히 여러 개의 파라미터를 받는 이중 함수의 경우 중괄호(클로져)를 사용해서 더 간결하게 만들 수 있다.
// 함수와 다르게 함 수 이름 정의가 따로 존재한다. 하지만 파라미터를 받을 수 있고, 반환 값이 존재할 수 있기에 함수와 거의 일치하다.
// 즉, 함수는 이름이 있는 클로져이다.
// 'in' 키워드를 사용해서 파라미터, 반환 타입 영역과 실제 클로저의 코드를 분리한다.
func generator_three(message: String) -> (String, String) -> string {
    return { (firstName: String, lastName: String) -> String in
        return lastName + firstName + message
    }
}

// 생략1. generator() 함수에서 반환하는 타입을 가지고 클로저에서 어떤 파라미터를 받고 어떤 타입을 반환하는 지 알 수 있어서 생략이 가능하다.
func generator_four(message: String) -> (String, String) -> String {
    return { (firstName, lastName) -> String in
        return lastName + firstName + message
    }
}

// 생략2.타입 추론 덕에 첫 번째 파라미터가 문자열이고, 두 번째 파라미터가 문자열이라는 것을 알 수 있다.
// 첫 번째 파라미터를 $0, 두 번째 파라미터를 $1로 바꿔서 쓸 수 있다.
func generator_five(message: String) -> (String, String) -> String {
    return {
        return $0 + $1 + message
    }
}


// 생략3. 클로저 내부 코드가 한 줄이라면, return 까지도 생략할 수 있다.
func generator_six(message: String) -> (String, String) -> String {
    return { $1 + $0 + message }
}

// 클로져는 변수처럼 정의할 수 있다.
let hello_closure: (String, String) -> String = { $0 + $1 + "님 안녕하세요!" }
hello_closure("박", "요셉")

// 옵셔널로도 정의할 수 있다.
let hello_optional: ((String, String) -> String)?
hello_optional?("박", "요셉")

// 클로저를 변수로 정의하고 함수에서 반환할 수도 있는 것처럼, 파라미터로도 받을 수 있다.
func manipulate(number: Int, using block: Int -> Int) -> Int {
    return block(number)
}
manipulate(number: 10, using: { (number: Int) -> Int in
    return number * 2
})

// 생략도 가능하다.
manipulate(number: 10, using: {
    $0 * 2
})

// 만약 함수의 마지막 파라미터가 클로저라면, 괄호와 파라미터 이름마자 생략할 수 있다.
manipulate(number: 10) {
    $0 * 2
}

// sort(), filter()가 위와 같은 예시인데, 함수가 클로저 하나만을 파라미터로 받는다면, 괄호를 아예 쓰지 않아도 된다.
let number = [0, 1, 2, 3, 4, 5, 6, 7, 8, 8, 9, 102, 123, 34]

let sorted_number = number.sort { $0 < $1 }
let evens = number.filter { $0 % 2 == 0 }

// map()을 사용하면, 파라미터로 받은 클로저를 모든 요소에 실행하교, 그 결과를 반환한다.
let arr1 = [1,2,3,4,5,6,72,1,4]
let arr2 = arr1.map{$0 * 2}

// reduce()를 사용하면, 주어진 초기값과 첫 번째 요소의 클로저 실행결과, 그리고 그 결과와 두 번째 요소의 클로저 실행 결과... 끝까지 실행한 후의 값을 반환한다ㅣ.
arr.reduce(0) { $0 + $1 }
// 초기값이 0, 0과 1을 더하고, 2를 더하고 ...
// Swift에서 연산자도 함수이고, 함수는 곧 클로저이므로, 연산자는 클로저이다. 따라서 + 연산자를 클로저로 넘겨버릴 수 있다.
arr.reduce(0, +) //arr.reduce(0) { $0 + $1 }과 동일
