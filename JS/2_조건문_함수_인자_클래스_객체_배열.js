// 조건문
// 참(true)이 되는 경우 : -1, 1, 10, 100, 'hello', 'false', true
// 거짓(false)이 되는 경우 : 0, -0, '', undefined, null, false
// js 기준으로 0은 거짓, -0도 거짓 -- 양수나 음수나 0으로 되는 값은 거짓

const compare = -1

if (compare) { //참
   //...
}

//3항 연산자 (참과 거짓을 둘 다 확인하는 경우, 결과값 처리가 두 개가 모두 되어야되는 경우)
//if 문을 간소화 하기 위해서 사용
//? 전까지는 조건을 써주고 조건이 참이되는 경우 ? 바로 다음에 오는 게 '참' : 뒤에가 '거짓'
compare ? console.log('true') : console.log('false')  //true


//참일 경우 실행되는 것을 3가지로 표현하는 것
if (compare === true) {

}

if (compare) {

}

compare && console.log('true') // 전건이 참이여야 후건이 실행되기 때문.


// function in-depth
// 매개변수 -> 패래미터(parameter), argument(인자), passed variable(전달값), place-holder(undefined)
// 함수 선언 (정의) 시점에는 인자의 타입은 any (그 어떤 타입의 값도 들어올 수 있는 상태)
function func1(name, age) {
    console.log('hello: ', name) // 아무런 값을 전달하지 않고 호출한다면, undefined가 됨.
}

// default parameter
function goodBye(name = 'Joseph', age = 22) {
    console.log('goodBye : ', name)
    console.log('age : ', age)
}
goodBye('Jerry', 30) // goodBye : Jerry
goodBye() // goodBye : Joseph
// 디폴트 값이 설정되었을 경우, Joseph이라는 값이 먼저 대입이 되고, Jerry가 override되는 매커니즘이다.

//리턴하지 않는 함수
// 위의 goodBye 함수는 리턴이 없다.
const result = goodBye('yosep', 20) // 리턴받는 값이 없는 함수
console.log('result : '. result) //result: undefined




// rest parameter (무한 인자. 개수에 제한이 없는 인자를 선언)
// 간혹 함수에서 인자의 개수를 미리 정하기 어려운 경우가 있다. 그때 사용한다.
// react에서 ... <-전개 연산자 (spread operator)

function restFunc(...args) {

	//args.length
	console.log('length of args: ', args.length)
	console.log('...args: ', args)
}
  
restFunc(1, 2, 3, 4, 5, 'hello', 'there', 'nice', 'to', 'meet', 'you')
restFunc() //빈 배열

function printAll(...names) {
	//iterate (반복 열거)
	for (let i=0; i < names.length; i++) {
		console.log('loop index: ', i)
		console.log('loop value: ', names[i])
	}
	console.log('names : ', names)
}

//실제 현업에서는 argument (인자) 에 대한 타입 그리고 placeholder 개수는 명확한게 좋다
printAll(['hello', 'there', 'nice', 'to', 'meet', 'you'], 300, 500, 'hello', 'bye', 5000)

/////

function printAll(names) {
    console.log('names : ', names)
}
function printAll2(...names) {
    for (let i=0; i<names.length; i++) {
        console.log('loop index: ', i)
        console.log('loop value: ', names[i])
    }
    console.log('names : ', names)
}
printAll([200, 100, 10], 'hello', 'bye') // 무차별적으로 names에 단일 argument로 받아들어온다. plcae-holder가 하나이기에 첫 번째 값만 불려온다. 다른 값들은 무시한다.
printAll2('hello', 'there', 'nice', [200, 100, 10]) // place-holder가 여러 개 이기에 다 받아들여 온다.
// 문법적으로는 틀린 게 없다.
// but 실제 현업에서는 argument(인자) 에 대한 타입 그리고 Placeholder의 개수는 명확한 게 좋다.
// 최대한 함수를 명확하게 만드는 것이 좋다.




// named function, anonymous function

// 이건 이름이 있는 함수.
function helloWorld(a,b) {
    return a+b
}


// JS 함수의 특징 -> first-class function (일등석 지위) 를 지니고 있다.
// 1. 변수나 상수에 대입 가능
// 2. 다른 함수에 인자 (매개변수)로 전달 가능
// 3. 다른 함수에서 리턴될 수 있음

// anonymous function ==> 대표적인 게 arrow function (화살표 함수)
const anom = function(a, b) {
    return a + b
}

const anom2 = () => {return 100}
const anom3 = () => 200


// function hoist (가로채기)
function functionHoist() {
    console.log('functionHoist')
}
functionHoist() // 함수를 만들고나서 사용하는 게 원래는 일반적

functionHoist2() // Js는 순서가 엄격하지 않아서 선언되기 이전에 사용할 수 있다.
// 자동으로 엔진이 함수만 싹 긁어서 상단에 배치한다.
function functionHoist2() {
    console.log('functionHoist')
}






// 일반적으로 객체는 class의 파생물이라고 본다. class의 본을 떠서 메모리 공간에 올려진 실행 인스턴스.
// class를 이루는 구성요소 -> 멤버변수 + 메소드 (함수)
// - 멤버변수: property
// - 객체함수: method



class Human {
    //생성자
    constructor(name){
        // 멤버 변수 // global variable, instance variable (인스턴스 변수) -> iVar
        this.name = name
        this.age = 30
        this.address = 'Seoul'
    }

    // 멤버 함수
    sayHello() { // class의 메소드는 function이 안 붙는다.
        console.log('Hello ', this.name)
    }

    sayHello2(name) { //place-holder로만 남아있고, 출력시에는 undefined. 외부에서 받아온 name은 scope가 달라서 값이 들어오지 못함.
        console.log('Hello ', name)
    }

    sayBye() {
        console.log('Bye')
    }
}
// 일반적으로 class는 따로 파일을 만들어서 export, import해서 사용함.

const human1 = new Human('Joseph')
const human2 = new Human('Jose')
const human3 = new Human('Joh')

console.log('human1 name: ', human1.name)


// object literal (객체를 말 그대로 바로 간소화해서 쓰는 것)
const _human1 = {
    name: '',
    age: 30,
    address: 'Seoul'

}

let obj = {
	//property
	name: 'Hello',
	age: 20,

	//method
	eat() {
        console.log('Now eat something')
	}

	sleep() {
        console.log('Now sleep')
	}

}


// array literal
// array는 객체(참조)타입. 참조타입은 모두 클래스 형식이다. 따라서 내장함수(method)를 사용할 수 있다.
const arrLiteral1 = [1, 2, 3, 4, 5] 
const arrLiteralResult = arrLiteral1.join('') // 자동으로 String으로 붙여서 사용

// pop, push는 배열의 끝자락 index 요소를 건드리는 공통점이 있다.
// pop은 보통 stack (쌓여있는 것)에서 말미에 놓여있는 것을 제거(튕겨내다)
const popResult = arrLiteral1.pop() // 5 - 튕겨져 나간 것이 무엇인지를 return
arrLiteral1 // [1, 2, 3, 4] 

// push()
const pushResult = arrLiteral1.push(6) // 5
arrLiteral1 // [1,2,3,4,6]

// reverse()

// sort() 정렬


const arrLiteral2 = [1, 2, 3, 4, 5] 
// shift(), unshift() -> 배열의 제일 앞에 있는 요소를 건드린다.
arrLiteral2.shift() // 제일 앞에 있는 요소를 제거
arrLiteral2 // [2,3,4,5]

arrLiteral2.unshift(8) // 제일 앞에 데이터를 추가할 때
arrLiteral2 // [8, 2, 3, 4, 5]

// filter() => ****function(arrow function)을 인자로 받는다. 그리고 새로운 배열로 만든다.
// 모든 요소들에 적용
// 새로 만들기 때문에 기존의 배열에 영향을 주지 않는다.
const arrLiteral3 = [1,2,3,4,5]
const filtered = arrLiteral3.filter(e => e < 3 )
filtered // [1, 2]
arrLiteral3 // [1, 2, 3, 4, 5]


// find()
// ******arrow function을 인자로 받는다.
// 새로 만들기 때문에 기존의 배열에 영향을 주지 않는다.
const arr1 = [1,2,3,4,5,6,7]
const find1 = arr1.find(e => e > 3) // single value만 return
// 특정 조건에 부합하는, 정확한 하나의 값만 필요로 할 때 사용.

console.log('arr1 : ', arr1) //1,2,3,4,5,6,7
console.log('find : ', find1) //4



// map()
// ******arrow function : () => {} 을 인자로 받는다.
// 모든 요소들에 적용
// 새로 만들기 때문에 기존의 배열에 영향을 주지 않는다.
const mapped = arrLiteral3.map(e => e + 1 )
mapped // [2,3,4,5,6]


// concat() : 합치키
// 새로 만들기 때문에 기존의 배열에 영향을 주지 않는다.

const array1 = [1, 2, 3]
const array2 = [4, 5, 6]
const concatenated = arra1.concat(array2)
concatenated // 1, 2, 3, 4, 5, 6

