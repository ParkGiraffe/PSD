//
//  MyFirstApp
//
//  Created by 박요셉 on 2021/06/26.
//

import Foundation

// 1. 옵셔널 벗기기
let optional_email : String? = "hello@naver.com"

// 옵셔널 값이 있따고 가정하고 값에 바로 접근할 수 있도록 도와주는 키워드인 '!'를 사용
print(optional_email) // Optional("hellow@naver,com")
print(optional_email!) // hello@naver.com

// 만약 옵셔널의 값이 nil일 경우 !를 사용하면 에러가 발생한다.
// Java의 NullPointerException과 비슷
print(optional_nil!) // 런타임 에러




//-----------------------------------------------
// Swift2에는 있었으나, Swift3에서 deprecated 됨.
// 2. 암묵적으로 벗겨진 옵셔널 (Implicitly Unwrapped Optional)
// 옵셔널을 사용할 때 ? 대신에 !를 붙이면 ImplicitlyUnwrappedOptional 이라는 옵셔널로 정의된다.
// 이렇게 정의 된 옵셔널은 nil을 포함할 수는 있는데, 접근할 때 옵셔널 바인딩과 옵셔널을 벗기는 과정을 거치지 않고도 바로 값에 접근할 수 있다는 점에서 차이점이 발생한다.
var email : String! = "bye@naver.com"
print(email) // bye@naver.com


// 가급적이면 일반적인 옵셔널을 사용해서 정의하고, 옵셔널 바인딩 또는 옵셔널 체이닝을 통해 값에 접근하는 것이 바람직하다.

