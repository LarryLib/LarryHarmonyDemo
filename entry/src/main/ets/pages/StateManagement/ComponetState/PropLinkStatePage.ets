@Entry
@Component
struct StateManagemetnPage {
  @State propState: string = 'prop:'
  @State linkState: string = 'link:'

  build() {
    Column({space: 50}) {
      //  prop
      Column() {
        Button() {
          Text('父' + this.propState)
            .fontSize(18)
            .fontColor(Color.Red)
        }
        .backgroundColor(Color.Transparent)
        .onClick(() => {
          this.propState = this.propState + '父'
        })
        ChildProp({propState: this.propState})
      }
      .width('100%')
      .backgroundColor('#dddddd')

      //  link
      Column() {
        Button() {
          Text('父' + this.linkState)
            .fontSize(18)
            .fontColor(Color.Red)
        }
        .backgroundColor(Color.Transparent)
        .onClick(() => {
          this.linkState = this.linkState + '父'
        })
        ChildLink({linkState: $linkState})
      }
      .width('100%')
      .backgroundColor('#eeeeee')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct ChildProp {
  @Prop propState: string

  build() {
    Button() {
      Text('子' + this.propState)
        .fontSize(18)
        .fontColor(Color.Red)
    }
    .backgroundColor(Color.Transparent)
    .height(50)
    .onClick(() => {
      this.propState = this.propState + '子'
    })
  }
}

@Component
struct ChildLink {
  @Link linkState: string

  build() {
    Button() {
      Text('子' + this.linkState)
        .fontSize(18)
        .fontColor(Color.Red)
    }
    .backgroundColor(Color.Transparent)
    .height(50)
    .onClick(() => {
      this.linkState = this.linkState + '子'
    })

  }
}