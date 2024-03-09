@Entry
@Component
struct ExtendPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fancy()
          .fancy2(30)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Extend(Text) function fancy() {
  .fontColor(Color.Red)
}

@Extend(Text) function fancy2(size: number) {
  .fontSize(size)
  .fontColor(Color.Red)
}