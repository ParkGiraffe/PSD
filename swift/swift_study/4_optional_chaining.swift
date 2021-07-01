//
//  MyFirstApp
//
//  Created by 박요셉 on 2021/06/26.
//

import Foundation

// 1. 옵셔널 체이닝


let array: [String]? = []
var isEmptyArray = false

if let array = array, array.isEmpty {
  isEmptyArray = true
} else {
  isEmptyArray = false
}

isEmptyArray

// 위의 긴 코드가 아래와 같다.
let isEmptyArray = array?.isEmpty == true
// 옵셔널 체이닝은 옵셔널의 속성에 접근할 때, 옵셔널 바인딩 과정을 ? 키워드로 줄여주는 역할을 한다.

// array가 nil일 경우
   array?.isEmpty
// ~~~~~~
// 여기까지 실행되고 `nil`을 반환합니다.

// array가 빈 배열일 경우
   array?.isEmpty
// ~~~~~~~~~~~~~~
// 여기까지 실행되고 `true`를 반환합니다.

// array에 요소가 있는 경우
   array?.isEmpty
// ~~~~~~~~~~~~~~
// 여기까지 실행되고 `false`를 반환합니다.


