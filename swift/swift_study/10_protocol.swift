// swift api design 참고하기
import Foundation

// 1. Protocol
// 프로토콜은 인터페이스이다. 최소한으로 가져야 할 속성이나 메서드를 정의한다. 구현은 하지않고 정의만 한다.

// 전송가능한 인터페이스를 정의한다.
protocol Sendable {
    var from: String? { get }
    var to: String { get }
    
    func send()
}

// 클래스와 구조체에 프로토콜을 적용시킬 수 있다. 프로토콜을 적용하면, 프토로콜에서 정의한 속성과 메서드를 모두 구현해야 한다.

struct Mail: Sendable {
    var from: String?
    var to: String
    
    func send() {
        print("Send a mail from \(self.from) to \(self.to)")
    }
}

struct Feedback: Sendable {
    var from: String? {
        return nil // 피드백은 무조건 익명으로 보낸다.
    }
    var to: String
    func send() {
        print("Send a feedback to \(self.to)")
    }
}
