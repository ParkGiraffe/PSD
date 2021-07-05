//
//  MyFirstApp
//
//  Created by 박요셉 on 2021/06/26.
//

import Foundation

// 1. 조건문
// if

var age = 22
var student = ""

if age >= 20 {
    student = "대학생"
} else if age < 20 && age >= 15 {
    student = "학생1"
} else {
    student = "학생2"
}


student // 대학생


// if의 조건절에는 bool타입을 사용. swift에서는 타입검사가 엄격하기 때문에 아래와 같은 형식을 쓰지 못함.
var number = 0
if !number { // 컴파일 에러

}

// 이 형식을 지켜야만 한다.
if number == 0 {

}

// 빈 문자열이나 배열 등을 검사할 때도 명확하게 검사해야 함.
if name.isEmpty { ... }
if languages.isEmpty { ... }



// switch
// swift의 switch는 패턴매칭이 가능하다.
switch age {
case 15..<17:
    student = "학생1"
case 17..<20:
    student = "학생2"
default:
    student = "기타"
}
// a..<b와 같이 범위 안에 age가 들어있는 지를 검사할 수 있따.


//2. 반복문
//for
//내가 아는 그 for문과 유사
for language in languages {
    print("나는 무려 \(language)를 유창하게 쓸 수 있다.")
}
for (country, capital) in capitals {
    print("\(country)의 수도는 \(capital)입니다.")
}

//case에서 사용했던 a..<b를 그대로 이용할 수 있음.
for i in 1..<10 {
    print(i)
}

// i를 사용하지 않으면 _ 를 사용해서 무시할 수 있다.
for _ in 1..<10 {
    print('나는 철학과 학생')
}


//while
//내가 아는 while : 조건문의 값이 true일 때 계속 반복.
var i = 0
while i < 10 {
    print(i)
    i += 1
}
