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
print(october) // Optional(Month.october)

// Month(rawValue:)의 값이 옵셔널인 이유는, Enum에서 정의되지 않은 원시값을 가지고 생성할 경우 nil을 반환하기 때문이다.
Month(rawValue: 15) // nil

// 일반적으로 enum은 Int만을 원시값으로 가질 수 있다고 생각한다. 왜냐하면 다른 프로그래밍 언어에서 그러하기 때문이다.
// Swift의 enum은 조금 다른데, String을 원시값으로 가진다.
enum IssueState: String {
    case open = "open"
    case closed = "closed"
}
