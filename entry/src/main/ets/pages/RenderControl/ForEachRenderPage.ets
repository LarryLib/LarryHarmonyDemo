@Entry
@Component
struct ForEachRenderPage {
  @State data: Array<string> = []

  aboutToAppear() {
    for (let index = 0; index < 100; index++) {
      this.data.push(`${index}`)
    }
  }

  build() {
    List() {
      ForEach(this.data, (item: string, index) => {
        ListItem() {
          Text(item)
            .fontSize(20)
        }
      })
    }
  }
}