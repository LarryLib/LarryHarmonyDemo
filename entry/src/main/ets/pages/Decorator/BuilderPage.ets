@Entry
@Component
struct BuilderPage {
  @State message: string = 'Hello World'
  @State counter: number = 0

  build() {
    Column() {
      this.child(this.message)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(HorizontalAlign.Center)
  }

  //  默认为值传递
  @Builder
  child(msg: string) {
    Text(msg)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
  }
}