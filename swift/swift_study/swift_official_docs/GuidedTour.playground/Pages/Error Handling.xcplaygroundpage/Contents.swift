//: ## Error Handling
//:
//: You represent errors using any type that adopts the `Error` protocol.
//:
// 따로 Error 프로토콜이 있어서, 이걸로 에러처리를 한다
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

//: Use `throw` to throw an error and `throws` to mark a function that can throw an error. If you throw an error in a function, the function returns immediately and the code that called the function handles the error.
//:
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    } else if printerName == "Printer On Fire" {
        throw PrinterError.onFire
    }
    return "Job sent"
}



//: There are several ways to handle errors. One way is to use `do`-`catch`. Inside the `do` block, you mark code that can throw an error by writing `try` in front of it. Inside the `catch` block, the error is automatically given the name `error` unless you give it a different name.
//:
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error) // 따로 변수 설정 없이, error를 적으면 캐치한 에러를 자동으로 반환한다.
}
//: - Experiment:
//: Change the printer name to `"Never Has Toner"`, so that the `send(job:toPrinter:)` function throws an error.
//:
//: You can provide multiple `catch` blocks that handle specific errors. You write a pattern after `catch` just as you do after `case` in a switch.
//:
do {
    let printerResponse = try send(job: 1440, toPrinter: "Printer On Fire")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1440, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}


//: - Experiment:
//: Add code to throw an error inside the `do` block. What kind of error do you need to throw so that the error is handled by the first `catch` block? What about the second and third blocks?
//:
//: Another way to handle errors is to use `try?` to convert the result to an optional. If the function throws an error, the specific error is discarded and the result is `nil`. Otherwise, the result is an optional containing the value that the function returned.
//:
// try? 를 사용하면, error시 nil을, 다른 값은 옵셔널을 적용해서 return한다.
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

print(printerSuccess)
print(printerFailure)

//: Use `defer` to write a block of code that’s executed after all other code in the function, just before the function returns. The code is executed regardless of whether the function throws an error. You can use `defer` to write setup and cleanup code next to each other, even though they need to be executed at different times.
//:
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    // defer 블록의 특징
    // 함수 종료 직전에 실행된다.
    // defuer 블록이 읽히기 전에 종료되면 실행되지 않는다.
    // 가장 마지막에 호출된 defer블록부터 역순으로 호출된다.
    // defer블록을 중첨으로 사용할 때, 바깥쪽 블록부터 호출된다.
    defer {
        fridgeIsOpen = true
    }
    
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food) // array에서 contains 함수를 쓰면, 해당 array에 동일한 값이 있는지 체크한 후 bool값을 반환하는 것으로 보인다.
    return result
}
fridgeContains("eggs")
fridgeContains("banana")
print(fridgeIsOpen)



//: [Previous](@previous) | [Next](@next)
