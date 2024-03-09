@Entry
@Component
struct StylesPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .inner()
      .global()
      .justifyContent(FlexAlign.SpaceAround)
    }
    .height('100%')
  }

  @Styles inner() {
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Red)
    .onClick(()=>{
      console.info('inner')
    })
  }
}

@Styles function global() {
  .height('100%')
  .width('50%')
  .backgroundColor(Color.Green)
  .onClick(()=>{
    console.info('global')
  })
}