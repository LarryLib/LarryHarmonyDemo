import router from '@ohos.router'
import { LeftBackItem } from '../common/LeftBackItem'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        LeftBackItem({title: this.message})
        Text('push')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            //  真机或模拟器测试的
            router.pushUrl({url: 'pages/StateManagement/ApplicationState/PersistentStoragePage'})
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}