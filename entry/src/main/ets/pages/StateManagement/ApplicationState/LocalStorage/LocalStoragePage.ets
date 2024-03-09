import router from '@ohos.router'
import { LeftBackItem } from '../../../../common/LeftBackItem'

export let storage = new LocalStorage({ 'LocalStorage_ID_100': '1' })

@Entry(storage)
@Component
struct LocalStoragePage {
  @LocalStorageLink('LocalStorage_ID_100') keyStr: string = 'father'

  build() {
    Column() {
      LeftBackItem({ title: 'LocalStoragePage' })
      Text(this.keyStr)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Button('下一页')
        .onClick(() => {
          router.pushUrl({ url: 'pages/StateManagement/ApplicationState/LocalStorage/LocalStoragePage2' })
        })
      Button('父link更新')
        .onClick(() => {
          this.keyStr += 'fs' //  同步更新
        })
      Row() {
        child()
        child()
      }
    }
    .justifyContent(FlexAlign.SpaceAround)
    .width('100%')
    .height('100%')
  }
}

@Component
struct child {
  @LocalStorageProp('LocalStorage_ID_100') keyStr: string = 'child'

  build() {
    Column() {
      Text(this.keyStr)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)

      Text('link更新')
        .fontSize(30)
        .onClick(() => {
          let link1 = storage.link('LocalStorage_ID_100')
          link1.set('1link' + this.keyStr) //  同步更新

          let str = storage.get<string>('LocalStorage_ID_100') //  一次性读值
          storage.set<string>('LocalStorage_ID_100', str + '0') //  同步更新

          this.keyStr += 's' //  同步更新
        })

      Text('prop更新1')
        .fontSize(30)
        .onClick(() => {
          let prop1 = storage.prop('LocalStorage_ID_100')
          console.info(prop1.get() as string)
          prop1.set('1prop' + (prop1.get() as string)) //  不同步更新
          console.info(prop1.get() as string)
        })
      Text('prop更新2')
        .fontSize(30)
        .onClick(() => {
          let prop1 = storage.prop('LocalStorage_ID_100')
          console.info(prop1.get() as string)
          prop1.set('2prop' + (prop1.get() as string)) //  不同步更新
          console.info(prop1.get() as string)
        })
    }
    .justifyContent(FlexAlign.SpaceEvenly)
    .backgroundColor('#eeeeee')
    .height(300)
  }
}