export function arkTS() {

  var counter = 100 //  值传递
  var person = new Person('LarryName', 10)  //  引用传递
  var nums = [1, 2, 3]  //  引用传递
  var persons = []  //  引用传递
  console.info(`${person.name}\t${person.age}\t${nums}\t${counter}`)

  updateBaseDataType(counter)
  updateObject(person)
  updateArray(nums)
  updateObjects(persons)
  console.info(`${person.name}\t${person.age}\t${persons}\t${nums}\t${counter}`)
  console.info(`${person.name}\t${person.age}\t${persons}\t${nums}\t${counter}`)

  updateBaseDataType2({counter: counter})
  updateObject2({person: person})
  console.info(`${person.name}\t${person.age}\t${counter}`)

  testArray()
}

class Person {
  name: string
  age: number

  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }
}

function updateBaseDataType(counter: number) {
  counter += 1
}

function updateObject(person: Person) {
  person.name = 'testObject'
  person.age += 1
}

function updateArray(nums: Array<number>) {
  nums.push(99)
}

function updateObjects(persons: Array<Person>) {
  persons.push(new Person('name', 20))
}

function updateBaseDataType2($$: {counter: number}) {
  $$.counter += 1
}

function updateObject2($$: {person: Person}) {
  $$.person.name = 'testObject'
  $$.person.age += 1
}

// 高阶函数
function testArray() {
  var nums = [4, 1, 2, 3]

  let sum = nums.reduce((sum, v) => sum + v, 0)
  console.info(`sum = ${sum}`)

  nums.sort((a, b) => b - a)
  console.info(`${nums}`)

  nums.forEach((value) => {
    console.info(`${value}`)
  })
}

function testString() {
  var str = '123456'
  str.concat('x', 'y')
  console.info(str)
}
