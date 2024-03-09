import { LeftBackItem } from '../../../../common/LeftBackItem'
import { storage } from './LocalStoragePage'

@Entry(storage)
@Component
struct LocalStoragePage2 {
  @LocalStorageLink('LocalStorage_ID_100') keyStr: string = 'father'

  build() {
    Column() {
      LeftBackItem({title: 'LocalStoragePage'})
      Column() {
        Text(this.keyStr)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Button('link更新')
          .onClick(() => {
            let link1 = storage.link('LocalStorage_ID_100')
            console.info(link1.get() as string)
            link1.set(this.keyStr + '2link ')
            console.info(link1.get() as string)
          })
        Button('prop更新')
          .onClick(() => {
            //  出{}失效?
            let prop1 = storage.prop('LocalStorage_ID_100')

            console.info(prop1.get() as string)
            prop1.set(this.keyStr + '2pro ')
            console.info(prop1.get() as string)

            let prop2 = storage.setAndProp('LocalStorage_ID_100', '100')
            console.info(prop2.get() as string)
            prop2.set(this.keyStr + '2pro ')
            console.info(prop2.get() as string)
          })
      }
      .justifyContent(FlexAlign.SpaceAround)
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}

