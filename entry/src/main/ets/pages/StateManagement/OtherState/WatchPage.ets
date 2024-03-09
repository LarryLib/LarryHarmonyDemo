@Entry
@Component
struct WatchPage {
  @State @Watch('messageChanged') message: string = 'Hello World'

  messageChanged() {
    console.info('message = ' + this.message)
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('Click')
          .onClick(() => {
            this.message += '1'
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}