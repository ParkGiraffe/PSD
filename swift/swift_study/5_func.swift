//
//  MyFirstApp
//
//  Created by 박요셉 on 2021/06/26.
//

import Foundation

// 1. 함수
// func 키워드를 사용한다. '->'를 사용해서 함수의 반환타입을 지정한다.
func hello(name : String, time:Int) -> String {
    var string = ""
    for _ in 0..<time{
        string += "\(name)님 안녕하세요!\n"
    }
    return string
}

// swift는 함수를 호출할 때 파라미터 이름을 같이 써줘야 한다.
hello(name:"박요셉", time:3)


// 함수를 호출할 때 파라미터 이름과 함수 내부에서 사용하는 파라미터 이름을 다르게 사용하고 싶을 경우
func hello_two (to name: String, numberOfTimes time: Int) {
    for _ in 0..<time {
        print(name)
    }
}

hello_two(to : "박요셉", numberOfTimes:"3") // 이곳에는 to, numberOfTimes를 사용.


// 파라미터 기본값을 설정할 수 있고, 기본값이 설정된 파라미터는 함수 호출 때 생략할 수 있다.
func hello_three (to name: String, numberOfTimes time: Int = 1) {
    for _ in 0..<time {
        print(name)
    }
}

hello_three(to:"박요셉")


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
func hello_four (name:String, time: Int) {
    func message(name:String) -> String{
        return "\(name)님 안녕하세요!"
    }
    
    for _ in 0..<time {
        print(message(name:name))
    }
}


// 함수 안에 정의한 함수를 반환할 수도 있다.
// generator의 함수의 반환타입은 (String) -> String이다.
// 즉 'generator'는 '문자열[message]을 받아서 문자열을 반환하는 함수[hello(name) + message]'를 반환하는 함수이다.
func generator(message: String) -> (String) -> String {
  func hello(name: String) -> String {
    return name + message
  }
  return hello
}

let hello = generator(message: "님 안녕하세요!")
hello("전수열")


// generator 안의 hello 함수가 여러 개의 파라미터를 받는다면?
// (String)->String에서 (String, String) > String으로 바뀌었다. 문자열 두 개를 받아서 문자열을 반환한다는 의미이다.
func generator(message: String) -> (String, String) -> String {
  func hello(firstName: String, lastName: String) -> String {
    return lastName + firstName + message
  }
  return hello
}

let hello = generator(message: "님 안녕하세요!")
hello("수열", "전")
