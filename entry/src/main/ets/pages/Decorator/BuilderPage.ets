@Entry
@Component
struct BuilderPage {
  @State message: string = 'Hello World'
  @State counter: number = 0

  build() {
    Column() {
      this.child1({msg: this.message})
      this.child2(this.message)
      this.child3({msg: this.message, counter: this.counter})
      this.child4({msg: this.message}, this.counter)
      Button('点击')
        .onClick(() => {
          this.counter += 1
          this.message = this.message + 'A'

          console.info('message = ' + this.message)
          console.info('counter = ' + this.counter)
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(HorizontalAlign.Center)
  }

  @Builder child1($$: {msg: string}) {
    Text('引用传递：' + $$.msg)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
  }

  //  默认为值传递
  @Builder child2(msg: string) {
    Text('值传递' + msg)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
  }

  //  引用传递+引用传递
  @Builder child3($$: {msg: string, counter: number}) {
    Column() {
      Text('引用传递：' + $$.msg)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Text('引用传递：' + $$.counter)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
    }
    .height(60)
    .width('100%')
    .backgroundColor('#dddddd')
  }

  //  值传递+引用传递
  @Builder child4($$: {msg: string}, counter: number) {
    Column() {
      Text('值传递：' + counter)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Text('引用传递：' + $$.msg)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
    }
    .height(60)
    .width('100%')
    .backgroundColor('#dddddd')
  }
}