//: ## Objects and Classes
//:
//: Use `class` followed by the class’s name to create a class. A property declaration in a class is written the same way as a constant or variable declaration, except that it’s in the context of a class. Likewise, method and function declarations are written the same way.
//:
class Shape {
    var numberOfSides = 0
    let exampleNum = 10
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    func printExampleNum() -> String {
        return "example number is \(exampleNum)"
    }
}

//: - Experiment:
//: Add a constant property with `let`, and add another method that takes an argument.
//:
//: Create an instance of a class by putting parentheses after the class name. Use dot syntax to access the properties and methods of the instance.
//:
var shape = Shape() // 인스턴스 생성
shape.numberOfSides = 7 // .블라블라 를 통해서 properties 와 methods에 접근.
var shapeDescription = shape.simpleDescription()
print(shape.exampleNum)

//: This version of the `Shape` class is missing something important: an initializer to set up the class when an instance is created. Use `init` to create one.
//:
// init을 통해서, instance의 initializer의 값을 받아올 때 어떻게 받아올 지를 설정.
class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
       self.name = name
    }

    func simpleDescription() -> String {
       return "A shape with \(numberOfSides) sides."
    }
}

//: Notice how `self` is used to distinguish the `name` property from the `name` argument to the initializer. The arguments to the initializer are passed like a function call when you create an instance of the class. Every property needs a value assigned—either in its declaration (as with `numberOfSides`) or in the initializer (as with `name`).
//:
//: Use `deinit` to create a deinitializer if you need to perform some cleanup before the object is deallocated.
//:
//: Subclasses include their superclass name after their class name, separated by a colon. There’s no requirement for classes to subclass any standard root class, so you can include or omit a superclass as needed.
//:
//: Methods on a subclass that override the superclass’s implementation are marked with `override`—overriding a method by accident, without `override`, is detected by the compiler as an error. The compiler also detects methods with `override` that don’t actually override any method in the superclass.
//:
class Square: NamedShape { // superclass인 NamedShape를 불러오는 subclass, class 다음에 :를 써서 superclass를 불러옴.
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name) // 상위 클래스 생성자 불러옴
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String { // superclass의 함수를 덮어쓸 경우에는 override를 사용해야 함. 안 쓰면 오류 뜸. 필요 없는 데 써도 경고 뜸.
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()



class Circle: NamedShape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        
    }
    func area() -> Double {
        return radius * radius * 3.14
    }
    override func simpleDescription() -> String {
        return "Radius of this circle is \(radius)"
    }
}
let circleClassTest = Circle(radius: 10, name: "my test circle")
circleClassTest.area()
circleClassTest.simpleDescription()
//: - Experiment:
//: Make another subclass of `NamedShape` called `Circle` that takes a radius and a name as arguments to its initializer. Implement an `area()` and a `simpleDescription()` method on the `Circle` class.
//:
//: In addition to simple properties that are stored, properties can have a getter and a setter.
//:


// 3. 속성 (properties)
// 속성은 크게 두 가지이다. 값을 가지는 속성(stored property)과 계산되는 속성(computed property)이다.
// 속성이 값 자체를 가지고 있는지, 혹은 어떠한 연산을 수행한 뒤 그 결과를 반환하는 지의 차이.
// 위에서 사용한 name, age와 같은 속성은 stored property이다.
// computed property는 get, set을 사용해서 정의할 수 있다.

// set 에서는 새로 설정될 값을 newValue라는 예약어를 통해 접근할 수 있다.

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
             return 3.0 * sideLength // get은 인스턴스를 통해 값이 들어왔을 때 이에 맞춰서 perimeter을 계산하게 한다.
        }
        set {
            sideLength = newValue / 3.0 // set은 dot accessor을 통해 perimeter가 설정될 경우, 이에 맞춰서 set에 놓인 sideLength를 다시 계산해준다.
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
// get 사용
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
// set 사용
triangle.perimeter = 9.9
print(triangle.sideLength)

//: In the setter for `perimeter`, the new value has the implicit name `newValue`. You can provide an explicit name in parentheses after `set`.
//:
//: Notice that the initializer for the `EquilateralTriangle` class has three different steps:
//:
//: 1. Setting the value of properties that the subclass declares.
//:
//: 1. Calling the superclass’s initializer.
//:
//: 1. Changing the value of properties defined by the superclass. Any additional setup work that uses methods, getters, or setters can also be done at this point.
//:
//: If you don’t need to compute the property but still need to provide code that’s run before and after setting a new value, use `willSet` and `didSet`. The code you provide is run any time the value changes outside of an initializer. For example, the class below ensures that the side length of its triangle is always the same as the side length of its square.
//:
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength // triangle.sideLength가 바뀌면, square.sideLengtheh 변경
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength // square.sideLengtheh가 바뀌면,  triangle.sideLength 변경
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square") //square.sideLength가 50으로 변경되어서
print(triangleAndSquare.triangle.sideLength) //square에 지정된 willSet에 따라, triangle.sideLength도 50으로 변경됨.

//: When working with optional values, you can write `?` before operations like methods, properties, and subscripting. If the value before the `?` is `nil`, everything after the `?` is ignored and the value of the whole expression is `nil`. Otherwise, the optional value is unwrapped, and everything after the `?` acts on the unwrapped value. In both cases, the value of the whole expression is an optional value.
//:
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength // 만약 인스턴스의 class에 ?(optional value)가 붙었을 경우, 값에 접근할 때도 ?를 써야 한다. 안 쓰면 오류가 뜸.
print(sideLength)


//: [Previous](@previous) | [Next](@next)
