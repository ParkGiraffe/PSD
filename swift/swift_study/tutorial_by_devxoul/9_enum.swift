//
//  MyFirstApp
//
//  Created by 박요셉 on 2021/06/26.
//

// swift api design 참고하기
import Foundation

// 1. Enum(Enumeration): 열거, 열거형

// 1월부터 12월까지를 enum으로 정의
// upper camel case 를 사용
enum Month: Int { // Int를 원시값(rawValue)을 가지도록 정의
    case january = 1 // 따라서 각 케이스들은 1부터 12가지의 값을 가지고 있음.
    case februray
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
    
    func simpleDescription() -> String {
      switch self {
      case .january:
        return "1월"
      case .february:
        return "2월"
      case .march:
        return "3월"
      case .april:
        return "4월"
      case .may:
        return "5월"
      case .june:
        return "6월"
      case .july:
        return "7월"
      case .august:
        return "8월"
      case .september:
        return "9월"
      case .october:
        return "10월"
      case .november:
        return "11월"
      case .december:
        return "12월"
        }
    }
}


let december = Month.december
print(december.simpleDescription()) // 12월
print(december.rawValue)            // 12

// 반대로 원시값을 가지고 enum을 만들 수 있다.
let october = Month(rawValue: 10)

// Month(rawValue:)의 값이 옵셔널인 이유는, Enum에서 정의되지 않은 원시값을 가지고 생성할 경우 nil을 반환하기 때문이다.
Month(rawValue: 15) // nil

// 일반적으로 enum은 Int만을 원시값으로 가질 수 있다고 생각한다. 왜냐하면 다른 프로그래밍 언어에서 그러하기 때문이다.
// Swift의 enum은 조금 다른데, String을 원시값으로 가진다.
enum IssueState: String {
    case open = "open"
    case closed = "closed"
}

// enum은 원시 값을 가지지 않을 수도 있다.
enum Spoon {0
    case dirt
    case bronze
    case silver
    case gold
    
    func simpleDescription() -> String{
        switch self {
        case .dirt:
            return "흙수저"
        case .bronze:
            return "동수저"
        case .silver:
            return "은수저"
        case .gold:
            return "금수저"
        }
    }
}

// Enum을 예측할 수 있다면 Enum의 이름을 생략할 수도 있다.
let spoon: Spoon = .gold // 변수에 타입 어노테이션이 있기 때문에 생략 가능 / 원래는 Spoon.gold

func doSomething(with spoon: Spoon) {
    // ...
}
doSomething(with: .silver) // 함수 정의에 타입 어노테이션이 있기 때문에 생략 가능


// 연관 값(Associated Values)을 가지는 Enum
// Enum은 연관 값을 가질 수 있다.
// invalidParameter 케이스는 필드 이름과 메시지를 가지도록 정의되었다.

enum NetworkError {
    case invalidParameter(String, String)
    case timeout
}
let error: NetworkError = .invalidParameter( "email", "이메일 형식이 올바르지 않습니다.")


// 이 값을 꺼내올 수 있는 방법으로는 if-case 또는 switch를 활용하는 것이 있다.

if case .invalidParameter(let field, let message) {
    print(field) // email
    print(message) // 이메일 형식이 올바르지 않습니다.
}

switch error {
case .invalidParameter(let field, let message) :
    print(field) // email
    print(message) // 이메일 형식이 올바르지 않습니다.

default:
    break
}

// 옵셔널은 Enum이다.
public enum Optional<Wrapped> {
    case none
    case some(Wrapped)
}
// 옵셔널이 왜 "값"과 "없는 값"을 포함하고 있다고 설명했는지, 그리고 "감싸다"라는 표현을 사용했는지 이해하기 위해서 알아야 할 내용이다.

// 옵셔널은 enum이기에 아래와 같은 구문도 사용할 수 있다.
let age: Int? = 20

switch age {
case .none: //nil일 경우
    print("나이 정보가 없습니다.")

case .some(let x) where x < 20:
    print("청소년")

case .some(let x) where x < 65:
    print("성인")

default:
    print("노인")
}

