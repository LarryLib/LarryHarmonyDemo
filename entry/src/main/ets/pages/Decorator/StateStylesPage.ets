
// stateStyles为属性方法
@Entry
@Component
struct StateStylesPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Button(this.message)
        .margin(20)
        .stateStyles({
          normal: {
            .backgroundColor(Color.Red)
          },
          pressed: {
            .backgroundColor(Color.Green)
          },
          disabled: {
            .backgroundColor(Color.Black)
          },
          // focused: {
          //   .backgroundColor(Color.Orange)
          // },
          // clicked: {
          //   .backgroundColor(Color.Yellow)
          // }
        })

      Button('Button1')
        .margin(20)
        .stateStyles({
          focused: {
            .backgroundColor(Color.Pink)
          },
          pressed: {
            .backgroundColor(Color.Black)
          },
          normal: {
            .backgroundColor(Color.Red)
          }
        })
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}