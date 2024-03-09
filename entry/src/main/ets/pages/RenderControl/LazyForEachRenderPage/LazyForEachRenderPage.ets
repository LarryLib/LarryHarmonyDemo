import { CommonIDataSource } from './CommonIDataSource';

@Entry
@Component
struct LazyForEachRenderPage {
  private data: CommonIDataSource = new CommonIDataSource();

  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.data.pushData(`Hello ${i}`)
      // this.data.pushData(`Hello ${i}`)
    }
  }

  build() {
    List({ space: 3 }) {
      LazyForEach(this.data, (item: string, index) => {
        ListItem() {
          Row() {
            Text(item).fontSize(50)
              .onAppear(() => {
                console.info("appear:" + item)
              })
          }.margin({ left: 10, right: 10 })
        }
        .onClick(() => {
          //  增
          // this.data.pushData(`new hello ${this.data.totalCount()}`)

          //  插入
          // this.data.addData(1, `new hello ${this.data.totalCount()}`)

          //  删
          this.data.deleteData(this.data.getIndex(item))

          //  改
          // this.data.changeData(index, item + '00');

          //  改多个，然后reloadData
          // this.data.modifyAllData();
          // this.data.reloadData();

        })
      }, (item: string) => item)
    }.cachedCount(5)
  }
}