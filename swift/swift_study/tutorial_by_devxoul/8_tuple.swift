//
//  MyFirstApp
//
//  Created by 박요셉 on 2021/06/26.
//

// swift api design 참고하기
import Foundation

// 1. 튜플(Tuple)

// 튜플은 어떠한 값들의 묶음을 말한다. 배열과 비슷한데, 배열과는 다르게 길이가 고정되어 있다.
// 값에 접근할 때 []가 이나라 '.'을 사용한다.
var coffeInfo = ("아이스 아메리카노", 5100)
coffeInfo.0 // 아이스 아메리카노
coffeInfo.1 // 5100
c0ffeInfo.1 = 5200 // 재설정

// 튜플의 파라미터에 이름을 붙일 수도 있다.
var namedCoffeeInfo = (coffee: "아이스 아메리카노", price: 5100)
namedCoffeeInfo.coffee // 아이스 아메리카노
namedCoffeeInfo.price // 5100
namedCoffeeInfo.price = 5200 // 5200으로 재설정

// 실제로 간단한 자료형을 만들 때에 구조체(struct) 대신 튜플을 사용해서 만들기도 한다.
var coffeeInfo2: (String, Int)
var namedCoffeeInfo2: (coffee: String, price: Int)

// 튜플을 조금 응용하여, 여러 변수에 값을 지정할 수 있다.
let (coffee, price) = ("아이스 아메리카노", 5100)
coffee // 아이스 아메리카노
price // 5100

// 튜플이 가진 값을 가지고 변수에 값을 지정할 때, 무시하고 싶은 값이 있다면 '_' 키워드를 사용한다.
let (_, latteSize, lattePrice) = ("라떼", "Venti", 5500)
latteSize // Venti
lattePrice // 5500
// "라떼"라는 첫 번째 값은 무시한다.

// 튜플을 반환하는 함수를 만들 수 있다.
// 커비 이름에 맞는 커피 가격 정보를 반환한다. 일치하는 커피 이름이 없다면 nil을 반환한다.
func coffeInfoFunction(for name: String) -> (name: String, price: Int)? {
    let coffeeInfoList: [(name: String, price: Int)] = [
        ("아이스 아메리카노", 5100),
        ("라떼". 5500)
    ]
    for coffeeInfo in coffeInfoList {
        if coffeeInfo.name == name {
            return coffeeInfo // 커피 이름과 가격 정보로 구성된 튜플을 반환한다.
        }
    }
    return nil
}
coffeeInfoFunction(for: "아이스 아메리카노")?.price // 5100
coffeeInfoFunction(for: "아메리카노")?.price // nil

let (_, lattePrice2) = coffeeInfoFunction(for: "라떼")!
lattePrice2 // 5500
