//: ## Generics
//:
//: Write a name inside angle brackets to make a generic function or type.
//:
// generic : 포괄적인, 통칭의
// <> 안에 쓰인 것이 내가 원하는 타입이다. 어떤 타입이 쓰이냐에 따라 적용된 매개변수의 타입이 달라진다.
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
         result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)
// Item에 String이 들어오면, 타입추론으로 자료형을 자동인식한다.

//: You can make generic forms of functions and methods, as well as classes, enumerations, and structures.
//:
// 함수, 구조체, 클래스, 열거형 등등에서  generics를 쓸 수 있다.
// implement : 시행하다.
// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)
print(possibleInteger)

//: Use `where` right before the body to specify a list of requirements—for example, to require the type to implement a protocol, to require two types to be the same, or to require a class to have a particular superclass.
//:
// where의 주 사용처
// 1. 패턴과 결합하여 조건 추가
// 2. 타입에 대한 제약 추가

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
   return false
}
anyCommonElements([1, 2, 3], [2])
anyCommonElements([1, 2, 3], [4])



func showCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Element]
    where T.Element: Equatable, T.Element == U.Element {
        var result:[T.Element] = []
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    result.append(lhsItem)
                }
            }
        }
        return result
}
showCommonElements([1, 2, 3], [3])
//: - Experiment:
//: Modify the `anyCommonElements(_:_:)` function to make a function that returns an array of the elements that any two sequences have in common.
//:
//: Writing `<T: Equatable>` is the same as writing `<T> ... where T: Equatable`.
//:
// have in common : 공통적으로 가지고 있다.

//: [Previous](@previous) | [Next](@next)


