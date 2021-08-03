// array
// array도 class와 같은 객체 타입이기에, method(내장함수)를 지닌다.
[1, 2, 3].length // 간소화 표기 -> 배열 리터럴
[1, 2, 3].sort()

// sort
const arr = [2, 1, 5, 6, 7]
const sorted = arr.sort((a,b) => a-b) //오름차순 // a에서 b로 간다.
const sorted2 = arr.sort((a,b) => b-a) //내림차순 // b에서 a로 간다.
console.log('sorted : ', sorted)
console.log('sorted2 : ', sorted2)

// *** - filter, map, push, pop

// find
const found = arr.find(e => e > 1)  //참고로 과거형으로 변수 명을 적는 게 convention이다.

// join
const joined = arr.join() // default: ','가 들어간다. 
const joined1 = arr.join('')
const joined2 = arr.join('-')
const joined3 = arr.join(' ')

// split 
const strObj = String('this is a string') // 객체의 특징을 지님.
const str = 'this is a string' // string literal. 
// 객체타입처럼 보이지만, 너무 기본적인 데이터 형이라서 그냥 원시타입이라고 함.
// 그래서 그냥 string literal로 써버림.
// 그리고 call by value이기도 함. (그래서 클래스형 객체가 아님.)
const splitArr = str.split(' ') //split with token (tokenizer)가 필요함. 어떤 것을 기준으로 나눌 것인가.
console.log('splitArr : ', splitArr)

const joinedArr = splitArr.join(' ')


// slice (뜨다)
// 특징 : map, filter 처럼 새로운 배열을 리턴한다.
// 특징 : end 범위가 -1 까지 slice된다. end범위 직전 거 까지만 slice.
const target = [1, 2, 3, 4, 5, 6, 7, 8]
const sliced = arr.slice(3, 7) // [4,5,6,7]


// splice (지우다, 범위 지정 삭제, 삭제 후 신규 값 추가)
// 특징 : 기존 배열을 조작
target.splice(2) //[1,2]
// deleteCount가 지정되지 않으면, start 이후의 값은 모두 지워짐.

// target.splice(2, 3)-> 국소 제거, 국소 추가
const target2 = [1, 2, 3, 4, 5, 6, 7, 8]
target2.splice(2, 3) // [1,2,6,7,8]


// startNum, deleteCount 이후의 값은 rest parameter로 불러들여온다.
// 제거된 곳에 값을 넣는다.
const target3 = [1, 2, 3, 4, 5, 6, 7, 8]
target3.splice(2, 3, 100, 200, 300) // [1, 2, 100, 200, 300, 6, 7, 8,]

// rest parameter이다보니, 여러 개를 이후에 적어도 다 들어간다.
// 제거된 개수랑 달라도 다 중간에 끼어 넣어버린다.
const target4 = [1, 2, 3, 4, 5, 6, 7, 8]
target4.splice(2, 3, 100, 200, 300, 400, 500) // [1, 2, 100, 200, 300, 400, 500, 6, 7, 8]

// reduce (***)
target.reduce((a, b) => a + b) // 요소들이 서로 연결되어서 계산.
// map 과의 차이 - 요소들이 연결되어 있어서 (a,b)처럼 두 개 이상을 인자로 받음.


/* array in-depth */
/* spread operator (전개 연산자) */
const spreadTarget = [100, 200, 300, 400, 500]
const spread = [...spreadTarget] // 전개연산자를 통해서 spreadTarget의 값을 가져옴.
// const spread = spreadTarget (call by reference)와 전혀 다르다. 값만 가져와서 복사하는 거임.
const spread2 = [10, 20, ...spreadTarget, 600, 700] 

const obj = {
    name : 'Joseph',
    age: 22,
    city: 'Suncheon',
}

const spreadObj = {
    ...obj
}
console.log('spreadObj: ', spreadObj) // 그대로 obj를 가져옴.

const spreadObj2 = {
    ...obj,
    name: 'Jerry',
    age: 30
} // obj (기존의 객체)를 가져오고, 일부분만 수정해서 사용할 때 활용.

// 주의사항!
const spreadObj2 = {
    name: 'Jerry',
    age: 30,
    ...obj,
} // 이렇게 뒤에서 불러와버리면, 기존의 거가 덮어써버림. 문법적으로 틀렸다고는 안 하는데.. 쓰임새가 달라짐.
// 그러므로 전개연산자로 원본 값을 먼저 가져오고 그 다음에 수정하고자 하는 속성을 아래 지정해야 한다.


/* de-construct (비구조화) */

// construct (구조화)
let structuredObj = {
    name: 'Holiday',
    age: 20,
    city: 'Seoul'
}

// 객체의 비구조화 {}를 사용
// 기존 구조에서 비구조화 문법을 통해서 특정 값을 추출하기 위해 사용
const { name, age, ...strRest } = structuredObj;
console.log('name: ', name) // 출력 : Holiday
console.log('stuructureObj.name: ', structuredObj.name)
console.log('strRest: ',...strRest) // 출력 : {city: 'Seoul'} - 객체형태로 rest가 가져온다.
// {name, age, city, ...strRest} : 이때 strRest는 -{}로 출력된다. 빈 object이기 때문.
// {name, age, ...strRest, city} - rest는 나머지 값을 가져오는 전개 연산자이기 때문에 object이어도 에러가 발생한다.


// 배열의 비구조화 []를 사용
const [first, a, b, second] = target
console.log('first', first)
console.log(second) // 이름은 상관 없어서, 해당 순번의 값만 가져옴.

const [a, b, c, ...rest] = spreadTarget
console.log(a) //100
console.log(b) //200
console.log(c) //300
console.log(rest) // 400, 500 (레스트는 앞의 순서를 기억하고 남은 것들만 rest로 리턴한다.)

const [a, b, c, d, e, ...rest] = spreadTarget
console.log(a) //100
console.log(b) //200
console.log(c) //300
console.log(d) //400
console.log(3) //500
console.log(rest) // [] // 빈 array로 출력된다.
//실제로 함수에서 rest parameter로 사용하면 그 인자의 자료형은 array이다.
// 받은 게 없음으로 []이다.

const [a, b, ...rest, d, e] = spreadTarget // error 발생 - '...'은 무조건 마지막 자리에 위치해야 한다.

const [a, b,  , d, e, ...rest] = spreadTarget
console.log(d) // 400
// , ,로 사이를 빈공간으로 적으면, 해당 순서는 생략한다는 뜻이다.

//응용
let objArr = [
    {
      name: 'Jerry',
      age: 30,
      city: 'Seoul',
      country: 'Korea',
      score: 80
    },
    {
      name: 'Steve',
      age: 25,
      city: 'Incheon',
      country: 'Korea',
      score: 70
    },
    {
      name: 'Berry',
      age: 25,
      city: 'Busan',
      country: 'Korea',
      score: 100
    }
]

console.log(objArr.filter(e => e.score > 70))
console.log(objArr.filter(e => e.city === 'Busan'))

const reduced = objArr.reduce((a, b) => a.score + b.score) // 오류 발생.
// reduce를 할 때 왼쪽 값을 number로 만들어 졌지만, 오른쪽 값은 여전히 객체이기에, 계산이 안 되고 오류가 발생한다.
// 그래서 객체를 미리 전부 계산하고 싶은 숫자만 따로 빼놓을 필요가 있다.


//객체가 담긴 배열에서 reduce를 행할 때는 최종적으로 reduce 하기 좋은 형태로 map(매핑)을 수행하고 reduce를 이어서 진행한다.
const reduced1 = objArr.map(e => e.score).reduce((a, b) => a + b)
// NaN => not a number (숫자 값이 아닙니다.)
