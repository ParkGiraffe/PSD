//: ## Protocols and Extensions
//:
//: Use `protocol` to declare a protocol.
//:
// 1. Protocol
// 프로토콜은 인터페이스이다. 최소한으로 가져야 할 속성이나 메서드를 정의한다. 구현은 하지않고 정의만 한다.

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust() // mutating: 포로토콜 내부 요소(self)를 건드리겠다는 의미.
    //func send()
}

//: Classes, enumerations, and structs can all adopt protocols.
//:


class SimpleClass: ExampleProtocol {
     var simpleDescription: String = "A very simple class."
     var anotherProperty: Int = 69105
     func adjust() {
          simpleDescription += "  Now 100% adjusted."
     }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
     var simpleDescription: String = "A simple structure"
     mutating func adjust() {
          simpleDescription += " (adjusted)"
     }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

//포로토콜은 class, structure, enumeration에 적용 가능하다.
// 클래스와 구조체에 프로토콜을 적용시킬 수 있다. 프로토콜을 적용하면, 프토로콜에서 정의한 속성과 메서드를 모두 구현해야 한다.
// 프로토콜에 정의한 속성과 메서드가 구현되지 않으면 오류가 발생한다.



//: - Experiment:
//: Add another requirement to `ExampleProtocol`. What changes do you need to make to `SimpleClass` and `SimpleStructure` so that they still conform to the protocol?
//:
//: Notice the use of the `mutating` keyword in the declaration of `SimpleStructure` to mark a method that modifies the structure. The declaration of `SimpleClass` doesn’t need any of its methods marked as mutating because methods on a class can always modify the class.
//:
//: Use `extension` to add functionality to an existing type, such as new methods and computed properties. You can use an extension to add protocol conformance to a type that’s declared elsewhere, or even to a type that you imported from a library or framework.
//:
// mutate: 변형되다
// structure의 메서드가 self 접근 및 self값을 변형하기 위해 mutating 키워드를 사용한다.
// class에서는 메서드가 class를 변경하는 것이 기본적으로 가능하기에 mutating 키워드가 필요 없다


// extension은 이미 존재하는 자료형(기존 자료형, 직접 선언한 클래스나 구조체, 심지어 라이브러리나 프레임워크까지 )에 기능을 추가한다.
extension Int: ExampleProtocol { // Int 자료형에 ExampleProtocol을 적용시킨다.
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust(){
        self += 42 // 리턴 없이 self에 바로 적용하면, 원본 값에 영향을 줌.
    }
}
print(7.simpleDescription)
var testedInt = 4
testedInt.adjust()
print(testedInt)

extension Double {
    // Abs property
    func makeAbs() -> Double { // 결과값의 데이터형 잊지 않기.
        if self > 0 {
            return self
        } else {
            return -1 * self // 리턴이 있으면 따로 변수를 지정해서 저장해줘야 함. 원래 값은 변화 x
        }
    }
}
var testDoubleAbs = -1.476
let testTest = testDoubleAbs.makeAbs()
print(testDoubleAbs) // 원본 값 변화 없음

var testDoubleAbs2 = -1.3245
testDoubleAbs2.makeAbs()
print(testDoubleAbs2) // 따로 변수에 저장하지 않아도 위와 동일하게 원본 값에 변화 없음.


//: - Experiment:
//: Write an extension for the `Double` type that adds an `absoluteValue` property.
//:
//: You can use a protocol name just like any other named type—for example, to create a collection of objects that have different types but that all conform to a single protocol. When you work with values whose type is a protocol type, methods outside the protocol definition aren’t available.
//:
var protocolValue: ExampleProtocol = a // protocol type임에도 불구하고 SimpleClass로 지정됨.
print(protocolValue.simpleDescription)
protocolValue.adjust()
print(protocolValue.simpleDescription)
// print(protocolValue.anotherProperty)  // Uncomment to see the error
// error 메시지를 보면, SimpleClass로 지정됐음에도 불구하고, 컴파일러에서는 ExampleProtocol이라고 칭함.
// 실제로 anotherProperty는 SimpleClass에 지정된 property임에도 불구하고 에러가 발생한다.
// 요악하자면 포로토콜로 접근하는 경우, 포로토콜 내에서 지정된 메서드와 속성 만을 가져와서 이후에 지정된 클래스나 구조체를 통해 값을 전달받는 원리이다. 포로토콜 외의 메서드와 속성은 가져오지 않는다.

//: Even though the variable `protocolValue` has a runtime type of `SimpleClass`, the compiler treats it as the given type of `ExampleProtocol`. This means that you can’t accidentally access methods or properties that the class implements in addition to its protocol conformance.
//:


//: [Previous](@previous) | [Next](@next)
