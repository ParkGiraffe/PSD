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
