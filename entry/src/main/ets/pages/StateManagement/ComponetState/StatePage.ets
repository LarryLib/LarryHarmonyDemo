@Entry
@Component
struct StatePage {
  @State message: string = 'string'
  @State model: StateModel = new StateModel()

  @State msgArr: Array<string> = ['1', '2']

  build() {
    Column() {
      Text(this.message + Date())
        .textStyle()
        .onClick(() => {
          this.message += 'A'
        })

      Text(`model = ${this.model}` + Date())
        .textStyle()
        .onClick(() => {
          this.model = new StateModel()
        })

      Text(`model.name = ${this.model.name}` + Date())
        .textStyle()
        .onClick(() => {
          this.model.name += 'name'
        })

      Text(`model.age = ${this.model.age}` + Date())
        .textStyle()
        .onClick(() => {
          this.model.age += 1
        })

      Text(`msgArr = ${this.msgArr.concat(',')}` + Date())
        .textStyle()
        .onClick(() => {
          this.model.age += 1
        })

      Text(`msgArr push = ${this.msgArr.length}` + Date())
        .textStyle()
        .onClick(() => {
          this.msgArr.push('1')
        })

      Text(`msgArr pop = ${this.msgArr.length}` + Date())
        .textStyle()
        .onClick(() => {
          if (this.msgArr.length > 2) {
            this.msgArr.pop()
          }
        })

      Text(`msgArr[0] = ${this.msgArr[0]}` + Date())
        .textStyle()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}

@Extend(Text) function textStyle() {
  .fontSize(20)
}

class StateModel {
  name: string
  age: number

  constructor(name: string = 'str', age: number = 0) {
    this.name = name
    this.age = age
  }
}