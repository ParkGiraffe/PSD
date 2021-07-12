//
//  MyFirstApp
//
//  Created by 박요셉 on 2021/06/26.
//

// swift api design 참고하기
import Foundation

// 1. 클래스와 구조체

// 클래스는 class로 정의한다.
class Dog {
    var name: String?
    var age: Int?
    
    func simpleDescription() -> String {
        if let name = self.name { //옵셔널 바인딩
            return "\(name)"
        } else {
            return "empty"
        }
    }
}

// 구조체는 struct로 정의한다.
struct Coffee {
    var name: String?
    var size: String?
    
    func simpleDescription() -> String {
        if let name = self.name {
            return "\(name)"
        } else {
            return "empty"
        }
    }
}


var myDog = Dog() // 인스턴스 생성
myDog.name = "동동이"
myDog.age = 5

var myCoffee = Coffee()
myCoffee.name = "아이스 아메리카노"
myCoffee.size = "Large"

print(myDog.simpleDescription()) // 동동이
print(myCoffee.simpleDescription()) // 아이스 아메리카노


// 클래스는 상속이 가능하다. 구조체는 불가능하다.
class FourLegsAnimal {
    let numberOfLegs = 4
}

class Dog : FourLegsAnimal {
    let name: String?
    let age: Int?
}

var myDog = Dog()
print(myDog.numberOfLegs) // 4 <- FourLegsAnimal 클래스에서 상속받은 값 (4)


// 클래스는 참조(얕은 복사), 구조체는 복사(깊은 복사)이다.
var dog1 = Dog()  // dog1은 새로 만들어진 Dog()를 얕은 복사한다.
var dog2 = dog1   // dog2는 dog1의 Dog()를 공유한다.
dog1.name = "동동이" // dog1의 이름을 바꾸면 Dog()의 이름이 바뀌기 때문에
print(dog2.name)  // dog2의 이름을 가져와도 바뀐 이름("동동이")이 출력된다.

var coffee1 = Coffee()   // coffee1은 새로 만들어진 Coffee() 이다.
var coffee2 = coffee1    // coffee2는 coffee1을 깊은 복사한다.
coffee1.name = "아이스 아메리카노" // coffee1의 이름을 바꿔도
coffee2.name             // coffee2는 완전히 별개이기 때문에 이름이 바뀌지 않는다. (nil)이 출력됨.



// 2. 생성자 (Initializer)
// class와 struct 모두 생성자를 가지고 있다. 생성자에서 초기값을 지정할 수 있다.

class Dog2 {
    var name: String?  //속성이 옵셔널이 아니라면 항상 초기값을 가져야 한다.
    var age: Int       //그렇지 않다면 컴파일 에러가 발생한다.
    var breed: String = "doge" // 속성을 정의할 때 초기값을 지정해줄 수도 있다.
    
    init() {
        self.age = 0 // 새성자에서 age의 초기값을 0으로 설정
    }
}

struct Coffee2 {
    var name: String?
    var size: String?
    
    init(name: String?, size: String?) { // 생성자도 함수와 마찬가지로 파라미터를 받을 수 있다.
        self.size = "Tall"
    }
}


// 만약 상속받은 클래스라면 생성자에서 상위 클래스의 생성자를 호출해주어야 한다.
// 생성자의 파라미터가 상위 클래스의 파라미터와 같다면, 'override' 키워드를 붙여 주어야 한다.
// super.init()은 클래스 속성들의 초기값이 모두 설정된 후에 해야 한다.
// 그리고나서부터 자신에 대한 self 키워드를 사용할 수 있다.

class Dog3: FourLegsAnimal {
    var name: String?
    var age: Int?
    
    override init() {
        self.age = 0 // 초기값 설정
        super.init() // 상위 클래스 생성자 호출. 여기서부터 'self'접근 가능
        print(self.simpleDescription()) // super.init()을 하기 전에 self에 접근을 하면 에러가 발생한다.
    }
    
    func simpleDescription() -> String {
        if let name = self.name {
            return "\(name)"
        } else {
            return "empty"
        }
    }
    
    deinit { // deinit은 메모리에서 해제된 직후에 호출
         print("메모리 해제")
    }
}

// 3. 속성 (properties)
// 속성은 크게 두 가지이다. 값을 가지는 속성(stored property)과 계산되는 속성(computed property)이다.
// 속성이 값 자체를 가지고 있는지, 혹은 어떠한 연산을 수행한 뒤 그 결과를 반환하는 지의 차이.
// 위에서 사용한 name, age와 같은 속성은 stored property이다.
// computed property는 get, set을 사용해서 정의할 수 있다.

// set 에서는 새로 설정될 값을 newValue라는 예약어를 통해 접근할 수 있다.

struct Hex {
    var decimal: Int?
    var hexString: String? {
        get {
            if let decimal = self.decimal {
                return String(decimal, radix: 16)
            } else {
                return nil
            }
        }
        set {
            if let newValue = newValue {
                self.decimal = Int(newValue, radix: 16)
            } else {
                self.decimal = nil
            }
        }
    }
}

var hex = Hex()
hex.decimal = 10
hex.hexString // "a"

hex.hexString = "b"
hex.decimal // 11
// 위 코드에서 hexString은 실제 값을 가지고 있지는 않지만, decimal로부터 값을 받아와 16진수 문자열로 만들어 반환한다.
// decimal은 stored property, hexString은 computed property이다.

// get만 정의할 경우에는 get 키워드를 생략할 수 있다. 이런 속성을 읽기 전용 속성 (read only)이라고 한다.
struct Hex2 {
    var decimal: Int?
    var hexString: String?
    
    var hexCode: String? {
        if let hex = self.hexString {
            return "0x" + hex
        }
        return nil
    }
}
