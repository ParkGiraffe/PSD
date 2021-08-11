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



//이 문제에는 표준 입력으로 두 개의 정수 n과 m이 주어집니다.
//별(*) 문자를 이용해 가로의 길이가 n, 세로의 길이가 m인 직사각형 형태를 출력해보세요.

//let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
//let (a1, b) = (n[0], n[1])
//
//for i in 0 ..< b {
//    for j in 0 ..< a1 {
//        print("*", terminator: "")
//    }
//    print()
//}





// 두 정수 left와 right가 매개변수로 주어집니다. left부터 right까지의 모든 수들 중에서, 약수의 개수가 짝수인 수는 더하고, 약수의 개수가 홀수인 수는 뺀 수를 return 하도록 solution 함수를 완성해주세요.

func solution4(_ left:Int, _ right:Int) -> Int {
    var count: Int = 0
    var result: Int = 0
    for i in left ... right {
        count = 0
        for n in 1 ... i {
            if i%n == 0 {
                count += 1
            }
            
        }
        if count % 2 == 0 {
            result += i
        } else {
            result -= i
        }
    }
    
    return result
}

solution4(13,17) //43
solution4(24,27) //52
