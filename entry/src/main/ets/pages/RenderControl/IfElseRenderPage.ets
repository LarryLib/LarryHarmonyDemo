@Entry
@Component
struct IfElseRenderPage {
  @State isShow: boolean = false

  build() {
    Row() {
      Column() {
        Text(this.isShow ? '隐藏' : '展示')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.isShow = !this.isShow
          })

        if (this.isShow) {
          Text('Hello World')
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}