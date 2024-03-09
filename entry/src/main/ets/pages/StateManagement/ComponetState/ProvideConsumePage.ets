@Entry
@Component
struct ProvideConsumePage {
  @Provide('msg') msg: string = 'Base'

  build() {
    Column() {
      Text('child0:' + this.msg)
        .fontSize(25)
        .fontWeight(FontWeight.Bold)

      child1()

      Button('Click')
        .onClick(() => {
          this.msg += ' base'
        })
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .width('100%')
    .height('100%')
  }
}

@Component
struct child1 {
  build() {
    Column() {
      Text('child1')
        .fontSize(25)
        .fontWeight(FontWeight.Bold)
      child2()
    }
    .width('80%')
    .backgroundColor('#eeeeee')
  }
}

@Component
struct child2 {
  @Consume('msg') msg: string

  build() {
    Row() {
      Text('child2:' + this.msg)
        .fontSize(25)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.msg += '2'
        })
    }
    .backgroundColor('#dddddd')
  }
}