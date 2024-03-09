@Entry
@Component
struct ObservedPage {

  build() {
    Column() {
      //  用户-书籍测试
      UserBookList()

      //  其他测试
      Container0()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}

@Component
struct UserBookList {
  @State users: Array<User> = Array<User>()
  @State user: User = new User('Larry', 18, '北京', [new Book('平凡的世界', '路遥', 120), new Book('老人与海', '海明威', 283)])

  build() {
    Column() {
      //  用户信息
      Row() {
        Text(this.user.name)
          .userTextStyle()
        Text('年龄' + this.user.age)
          .userTextStyle()
        Text(this.user.address)
          .userTextStyle()
        Text('书籍数：' + this.user.books.length)
          .userTextStyle()
      }
      .backgroundColor('#dddddd')
      .width('100%')
      .height(80)
      .justifyContent(FlexAlign.SpaceEvenly)
      .onClick(() => {
        this.user.age ++
      })

      //  统计总的喜欢人数
      Text(`统计总的喜欢人数: ${this.user.books.reduce((sum, i) => sum + i.likes, 0)}`)
        .userTextStyle()

      //  Books
      List() {
        ForEach(this.user.books, (book: Book) => {
          ListItem() {
            BookItem({book: book!})
          }
        })
      }
      .width('90%')
    }
    .width('100%')
    .height('50%')
  }
}

@Component
struct BookItem {
  @ObjectLink book: Book

  build() {
    Row() {
      Text(this.book.name)
        .bookTextStyle()
      Text('作者' + this.book.author)
        .bookTextStyle()
      Text('喜欢人数:\n' + this.book.likes)
        .bookTextStyle()
    }
    .backgroundColor('#eeeeee')
    .width('100%')
    .height(80)
    .justifyContent(FlexAlign.SpaceEvenly)
    .onClick(() => {
      this.book.likes += 1
    })
  }
}

@Extend(Text) function userTextStyle() {
  .fontSize(20)
  .fontWeight(FontWeight.Bold)
}

@Extend(Text) function bookTextStyle() {
  .width('25%')
  .fontSize(15)
}

//  图书馆 用户模型
@Observed
class User {
  name: string
  age: number
  address: string
  books: Array<Book>

  constructor(name: string, age: number, address: string, books: Array<Book>) {
    this.name = name
    this.age = age
    this.address = address
    this.books = books
  }
}

//  书籍模型
@Observed
class Book {
  name: string
  author: string
  likes: number

  constructor(name: string, author: string, likes: number) {
    this.name = name
    this.author = author
    this.likes = likes
  }
}



/***************/
@Component
struct Container0 {
  @State a: A = new A()

  build() {
    Column() {
      Text('a.name = ' + this.a.name)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.a.name += 'a'
        })

      Text('a.b.name = ' + this.a.b.name)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.a.b.name += 'b'
        })

      // Container1({b: this.a.b})
    }
    .width('100%')
    .height('50%')
  }
}

@Component
struct Container1 {
  @ObjectLink b: B

  build() {
    Column() {
      Text(`b.name：${this.b.name}`)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          // 修改值，只会导致 @ObjectLink 装饰的变量所在的组件被刷新
          this.b.name += 'sub'
        })

    }
    .width('100%')
    .height('100%')
  }
}

@Observed
class A {
  name: string
  b: B

  constructor(name: string = 'A', b: B = new B()) {
    this.name = name
    this.b = b
  }
}

@Observed
class B {
  name: string

  constructor(name: string = 'B') {
    this.name = name
  }
}