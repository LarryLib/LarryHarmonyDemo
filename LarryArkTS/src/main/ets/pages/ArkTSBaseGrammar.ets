/*
 *  ArkTS基础语法
 * */
export function arkTSBaseGrammar() {
  test1BaseType()
  test2ConditionalStatement()
  test3Func()
  test4Class()
  test5Module()
  test6Iterator()
}

//  一、基础数据
function test1BaseType() {
  console.log('test1BaseType')
  console.log('一、基础数据')

  //  1、布尔值boolean
  let isDone: boolean = false
  console.log('isDone = ', isDone)

  //  2、数字number
  let decLiteral = 2024
  console.log('decLiteral = ', decLiteral)

  let binaryLiteral = 0b11111101000
  console.log('binaryLiteral = ', binaryLiteral)

  let octalLiteral = 0o3750
  console.log('octalLiteral = ', octalLiteral)

  let hexLiteral = 0x7e8
  console.log('hexLiteral = ', hexLiteral)

  //  3、字符串string
  let name = 'name'
  console.log('name = ', name)
  name = 'name1'
  console.log('name1 = ', name)

  //  4、数组array
  let list1: number[] = [1, 2, 3]
  console.log('list1 = ', list1)
  let list2: Array<number> = [1, 2, 3]
  console.log('list2 = ', list2)
  list2.push(100)
  console.log('list2 push 100 = ', list2)

  //  5、元组tuple
  let x: [string, number]
  x = ['Hello', 10]
  console.log(x.toString())

  //  6、枚举
  enum LarryType { T1, T2, T3 }

  let lt = LarryType.T1
  console.log(lt.toString())

  //  7、unknown
  let notSure: unknown = 4
  notSure = 'what?'
  notSure = false

  // console.log(notSure)

  //  8、void
  function func(): void {
    console.log('This is function is void')
  }

  func()

  //  9、null 和 undefined
  let u: undefined = undefined
  let n: null = null

  //  10、联合类型 union
  let my: string | number
  my = 'name'
  my = 7
  console.log(my.toString())
}

//  二、条件语句
function test2ConditionalStatement() {
  console.log('二、条件语句')

  let key = 'key'
  switch (key) {
    case 'key':
      break
    case 'key2':
      break
    default:
      break;
  }
}

//  三、函数
function test3Func() {
  console.log('三、函数')

  //  有名函数
  function add(x: number, y: number): number {
    return x + y
  }

  //  匿名函数
  let myAdd = function (x: number, y: number): number {
    return x + y
  }

  console.log('add(1, 1) = ' + add(1, 1))
  console.log('myAdd(1, 1) = ' + myAdd(1, 1))

  //  可选参数
  function buildName(firstName: string, lastName?: string) {
    if (lastName) {
      return firstName + ' ' + lastName
    } else {
      return firstName
    }
  }

  let name1 = buildName('Bob')
  let name2 = buildName('Bob', 'A')
  console.log(name1)
  console.log(name2)

  //  剩余参数
  function getEmployeeName(firstNam: string, ...restOfName: string[]) {
    return firstNam + ' ' + restOfName.join(' ')
  }

  let employeeName1 = getEmployeeName('Bob', 'Sandy', 'Mick')
  console.log(employeeName1)

  //  箭头函数
  let buildName2 = (firstName: string, lastName?: string) => {
    if (lastName) {
      return firstName + ' ' + lastName
    } else {
      return firstName
    }
  }
  console.log('buildName2("A", "A") = ' + buildName2('A', 'A'))
}

//  四、类class
export class Person {
  private name: string
  private age: number

  //  构造方法
  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }

  public getPersonInfo(): string {
    return 'My name is ${this.name} and age is ${this.age}'
  }
}

// 类的继承
class Employee extends Person {
  private department: string

  constructor(name: string, age: number, department: string) {
    super(name, age)
    this.department = department
  }

  public getEmployeeInfo(): string {
    return this.getPersonInfo() + 'and work is in ${this.department}'
  }
}

function test4Class() {
  console.log('四、类class')

  let person = new Person('Jacky', 13)
  console.log(person.getPersonInfo())

  let employee = new Employee('A', 10, 'BJ')
  console.log(employee.getEmployeeInfo())
}


//  五、模块
function test5Module() {
  console.log('五、模块')
}

//  六、迭代器，实现了Symbol.iterator
function test6Iterator() {
  console.log('六、迭代器，实现了Symbol.iterator')

  let array = [1, 'string', false]
  for (let index = 0; index < array.length; index++) {
    console.log(array[index].toString())
  }

  //  for...of语句：元素
  for (let entry of array) {
    console.log(entry.toString())
  }

  //  for...in语句：下标
  // for (let index in array) {
  //   console.log(index)
  // }
}