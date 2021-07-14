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
coffeInfo.0 // 아메리카노
coffeInfo.1 // 5100
c0ffeInfo.1 = 5200 // 재설정
