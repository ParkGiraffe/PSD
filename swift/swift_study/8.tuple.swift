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
