//
//  MyFirstApp
//
//  Created by 박요셉 on 2021/06/26.
//

import Foundation

// 1. 옵셔널 : 값이 있을 수도 있고 없을 수도 (nil) 있음.
// nil

// 값이 있을 수도 있고 없을 수도 있는 변수를 정의할 때에는 타입 어노테이션에 '?'를 붙여야 한다. 이렇게 정의한 변수를 optional이라고 한다.
// 옵셔널에 초기값을 지정하지 않으면 기본값은 nil이다.


var name : String?
print(name) // nil

name = "park yo sep"
print(name) // Optional("park yo sep")



// 옵셔널로 정의한 변수는 옵셔널이 아닌 변수와 다르다.
let optional_name : String? = "park yo sep"
let required_name : String = optional_name // 컴파일 에러

// required_name 변수는 옵셔널이 아닌 String이기에 항상 값을 가지고 있어야 한다. 반면에 optional_name은 옵셔널로 선언된 변수이기에
// 실제 코드가 실행되기 전까지는 값이 있는 지 없는 지를 알 수 없다.
// swift 컴파일러는 안전을 위해 required_name에는 옵셔널로 선언된 변수를 대입할 수 없게 만들었다.
// 따라서, optional은 '어떤 값 (String, Int, Bool 등의 값)' 또는 'nil'을 가지고 있는 선택적인 변수라고 봐야 한다.



// 2. 옵셔널 바인딩 : 옵셔널 값을 가져오는 방법
// 옵셔널 바인딩은 옵셔널의 값이 존재하는 지를 검사한 뒤, 만약 존재한다면 그 값을 다른 변수에 대입 가능하게 해준다.
// if let, if var 사용.
// 값이 존재한다면 if 문 안으로, nil이면 그냥 통과한다.

if let name = optional_name {
    print(name) // optional_name 안에 값이 지정되어 있다면, 해당 값이 출력됨.
}
// 해당 값이 존재하지 않으면 바로 통과.


// 하나의 if 문에 ','를 사용하여 여러 옵셔널을 바인딩할 수 있다.
var optional_one : String? = "one"
var optional_two : String? = "two"

if let one = optional_one,
   let two = optional_two {
    // one, two 값이 존재.
    // 모두 존재해야만 if 문 안이 실행됨.
    // 참고로 두 번째 let은 생략 가능
}


// 옵셔널 바인딩을 할 때, ','를 사용해서 조건도 함께 지정할 수 있다.
// ',' 이후의 조건절은 옵셔널 바인딩이 일어난 후에 실행된다. 즉, 옵셔널이 벗겨진 값을 가지고 조건을 검사한다.

var optional_age : Int? = 22
if let age = optional_age, age >= 20 {
    // age의 값이 존재하고, 20이상이다.
    print("나의 나이는 \(age)이고 대학생이다")
}


