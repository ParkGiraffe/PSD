//프로그래머스 1단계 연습장.

var a: String = "1"
//print(Int(a)) //Int를 쓰면 optional로 반환을 해서, unwrapped 과정이 필요하다


// 하샤드 수 구하기
func solution1(_ x:Int) -> Bool {
    var sum = 0
    for i in String(x) {
        if let number = Int(String(i)) {
            sum += number
        }
    }
    return x % sum == 0
}
solution1(123)



// 문자열의 가운데 문자 반환하기
func solution2(_ s:String) -> String {
    if s.count % 2 == 0 {
        return String(s[s.index(s.startIndex, offsetBy:(s.count / 2) - 1)]) + String(s[s.index(s.startIndex, offsetBy:(s.count / 2))])
    } else {
        return String(s[s.index(s.startIndex, offsetBy:(s.count / 2) - 1)])
    }
}

solution2("abcde")
solution2("qwer")


// 받은 Int를, 큰 숫자부터 차례대로 나열된 하나의 Int로 만들기.
func solution3(_ n:Int) -> Int {
    let a = String(n)
    var arr: [Int] = []
    for i in String(a) {
        if let intValue = Int(String(i)) {
            arr.append(intValue)
        }
    }
    let sortedArr = arr.sorted{$0 > $1}
    var joinedArr: String = ""
    for j in sortedArr {
        joinedArr = joinedArr + String(j)
    }
    if let result = Int(joinedArr) {
        return result
    }
    return 0
}

let result1 = solution3(504920)

