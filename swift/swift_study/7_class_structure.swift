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
    
    init() {
        self.size = "Tall"
    }
}


