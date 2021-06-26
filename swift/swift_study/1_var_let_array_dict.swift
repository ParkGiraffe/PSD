//
//  변수와상수.swift
//  MyFirstApp
//
//  Created by 박요셉 on 2021/06/26.
//

import Foundation

// 1. 변수와 상수

var name : String = "Park Yosep"
let birthday : Int = 2000
var height : Float = 182.9
Float(birthday) + height //2182.9

// 변수는 var, 상수는 let
// swift는 정적 타이핑 언어이므로 변수와 상수를 정의할 때 그 자료형이 어떤 것인지 명시해주어야 함.
// 하지만 타입 추론도 있어서 굳이 자료형을 명시하지 않아도 자동으로 맞춰줌.

var puppy_name = "동동이" // "" 사이의 값을 자동으로 String 자료형으로 인식

// 2. 배열과 딕셔너리

var family = ["박요셉","동동이"]
var capitals = [
    "한국" : "서울",
    "미국" : "워싱턴",
]
family[0] // 박요셉
capitals['한국'] // 서울
//대괄호 사용.

// 배열과 딕셔너리 또한 타입을 적을 수 있음.
var languages: [String] = ["Swift", "Kotlin", "Python", "Java"]
var capitals_type: [String: String] = [
  "한국": "서울",
  "미국": "워싱턴",
  "중국": "베이징",
]

//빈 배열이나 딕셔너리 정의
var empty_array: [Int] = []
var empty_dictionary: [String: String] = [:]
//생성자로 더 간결하게 정의
var initializer_array = [String]()
var initializer_dictionary = [String: String]()


