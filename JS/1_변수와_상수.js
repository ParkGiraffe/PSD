// 1. 변수와 상수

/* 프로그램(앱)의 데이터를 메모리에 저장할 수 있는 기본 단위 */

//변수 (변할수 있는 값을 저장) let
//상수 (변하지 않는 값을 저장) const
//ES6 이전에는 주로 var이라는 변수 선언을 사용했다.
//lowerCamelCase를 사용


/*
JS의 자료형

Number: Any number, including numbers with decimals: `4`, `8`, `1516`, `23.42`.
String: Any grouping of characters on your keyboard (letters, numbers, spaces, symbols, etc.) surrounded by single quotes: `' ... '` or double quotes `" ... "`. Though we prefer single quotes. Some people like to think of string as a fancy word for text.
Boolean: This data type only has two possible values— either `true` or `false` (without quotes). It’s helpful to think of booleans as on and off switches or as the answers to a “yes” or “no” question.
Null: This data type represents the intentional absence of a value, and is represented by the keyword `null` (without quotes).
Undefined: This data type is denoted by the keyword `undefined` (without quotes). It also represents the absence of a value though it has a different use than `null`.
Symbol: A newer feature to the language, symbols are unique identifiers, useful in more complex coding. No need to worry about these for now.
Object: Collections of related data.
*/

// 7.27 보충자료
// Null : 참조하는 메모리 주소값이 없음. 주소 참조가 없다.
// Undefined : 아직 정의가 되지 않은 
function hello(name, age) {
    console.log('hello : ', name)
}
hello() // hello : undefined
// JS에서는 함수에 들어오는 인자의 타입을 설정하지 않는다.
// 따라서 undefined 
// > JS는 유연하면서도 어려운 언어이다. 
// place-holder variable, argument : 함수의 인자 (위의 name과 age), JS는 매개변수의 타입이 정해지 있지 않으므로 자리만 차지하고 있는 변수라고 칭함.
hello('jerry', 20) // undefined였던 자리가 특정 변수(string, number)로 채워짐.

const result = hello('joseph', 25) // JS의 함수에서 return하는 값이 없다면? undefined를 리턴한다고 보면 된다. 따라서 result에서 undefined가 들어온다.
console.log(result) // undefined

//undefined의 특징은 타입과 값이 똑같이 undefined이다.
//Null도 마찬가지이다.

// 7.27 보충자료


//a라고 하는 변수를 선언. 값이 없어도 내용을 추가할 수 있다.
let a

//a라는 변수에 값을 대입
a = 100

//100의 값을 저장하고 300이라는 값을 다시 대입
a = 300

//b라는 상수를 선언과 동시에 숫자값 200을 대입
const b = 200

//b에다가 새 값을 대입 시도 (오류)
// + const는 undefined값으로 설정할 수 없다. 무조건 value가 필요하다.
b = 300

//콘솔에서 변수, 상수 값을 확인
console.log('a: ',a)
console.log('b: ',b)

// backticks를 감싸서 String Interpolation을 사용할 수 있다.
console.log(`a: ${a}`) // a: 300

// typeof Operator
// 변수의 자료형을 검사할 때 사용한다.
const unknown1 = 'yo';
console.log(typeof unknown1); // Output: string

const unknown2 = 10;
console.log(typeof unknown2); // Output: number


// 변수와 상수에 대한 타입은 크게 2개 (원시 / 객체) 로 구분된다


// 원시 타입 (Primitive type)
// string, number, boolean, undefined, null


//원시 타입 (primitive type)
let a  = 'string'    //string
let b  = 'c'         //string (글자 하나도 string)
let c  = 100         //number
let d  = 10.35       //number (소수값도 number)
let e  = false       //boolean
let f  = undefined   //undefined
let g  = null        //null

//원시 타입의 값 복사 예시
let aValue = 100
let bValue = aValue

console.log('aValue: ', aValue) //100
console.log('bValue: ', bValue) //100

//이때 bValue는 aValue의 값을 그대로 복사해서 aValue와 bValue 변수 개별적으로 100의 값을 보관


// 객체 타입 (Object type)
// object, array, function

/* object (객체) */
let obj = {
    name: 'Steve',
    age: 20
}

/* 
obj객체의 값들은 key-value 형태로 관리되며 각 객체의 key에 대응되는 value들은 원시타입처럼 값이 할당
name: 'Steve'는 마치 let name = 'Steve' 처럼 값 할당
age: 20는 마치 let age = 20 처럼 값 할당
obj는 name변수와 age변수에 대한 메모리 공간상의 주소값만을 지니고 있음 (obj 객체는 값이 아닌 객체의 값들에 대한 주소)
*/

let obj2 = obj
console.log('obj2.name: ',obj2.name) //Steve

//obj2 변수를 선언해 obj객체를 대입하면 obj의 주소값이 obj2에 복사됨 (값이 아닌 주소가 복사, 이를 '참조' 라고 부름)
//이렇듯 원시 타입처럼 값(value)가 그대로 복사되는 것은 copy-by-value라고 객체 타입은 copy-by-reference라고 한다

//call-by-reference (copy-by-reference): 같은 메모리 공간 주소를 바라보고 있음
//call-by-value (copy-by-value): 값이 그대로 복사 (서로 다른 메모리 공간 점유)

/* array (배열) */
// '[]'로 감싸서 만든다.
let arr  = ['hello','there']
let arr2 = arr

console.log('arr:', arr[0])   //arr: hello
console.log('arr2:', arr[1])  //arr2: there

arr2[2] = 'nice to meet you'
console.log('arr:', arr[2])   //arr: nice to meet you
//배열도 객체와 마찬가지로 메모리 공간을 참조하기 때문에 arr를 arr2에 대입한 이후 동일한 곳을 바라보는것을 확인할 수 있다

// JS의 배열은 어떤 타입이든 저장할 수 있다. 심지어 다른 타입끼리도 한 배열에 저장할 수 있다.
let egArr1 = ['example', 10, true]

// let으로 선언된 array일 경우, 배열 자체를 변경할 수 있다. 
// const로 선언된 array일 경우, 배열 자체를 변경할 수 없다. (주소를 다시 줄 수 없다.) 다만 그 안에 elements들을 수정할 수는 있다.
let condiments = ['Ketchup', 'Mustard', 'Soy Sauce', 'Sriracha'];
const utensils = ['Fork', 'Knife', 'Chopsticks', 'Spork'];


condiments [0] = 'Mayo';
console.log (condiments); 

condiments = ['Mayo'];
console.log(condiments);

utensils [3] =  'Spoon';
console.log(utensils);

/* 출력문 
[ 'Mayo', 'Mustard', 'Soy Sauce', 'Sriracha' ]
[ 'Mayo' ]
[ 'Fork', 'Knife', 'Chopsticks', 'Spoon' ]
*/


/* function (함수) */
function testFunc(a, b) {
    return a + b
}

let funcContainer = testFunc //testFunc 함수를 funcContainer 변수에 대입. initializer 사용 x
funcContainer(3, 5) //funcContainer 참조 실험

console.log('testFunc: ', testFunc(3, 5))            //testFunc: 8
console.log('funcContainer: ', funcContainer(3, 5))  //funcContainer: 8

//함수 또한 객체, 배열과 마찬가지로 객체 타입으로 값의 복사는 '참조' 형태로 이루어진다


