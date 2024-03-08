/*
*
*
* https://esnail.github.io/ts-gitbook/book/chapter2/readme.html
 * */
function Person (name, age) { // 构造函数
  this.name = name; // 属性
  this.age = age;
}
var p = new Person('张三', 25); // 实例化对象，p 为 Person 的一个实例
console.log(p.name);