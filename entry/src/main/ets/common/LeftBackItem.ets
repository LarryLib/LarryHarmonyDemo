import AppContext from '@ohos.app.ability.common'
import router from '@ohos.router'
import { TitleBarStyle } from '../constants/Constants'

@Component
export struct LeftBackItem {
  @Prop title: string
  build() {
    Row() {
      Image($r('app.media.ic_public_back'))
        .height(TitleBarStyle.IMAGE_BACK_SIZE)
        .width(TitleBarStyle.IMAGE_BACK_SIZE)
        .margin({ right: TitleBarStyle.IMAGE_BACK_MARGIN_RIGHT })
        .onClick(() => {
          try {
            router.back()
            console.info('SecondPage Back: Success')
          } catch (err) {
            console.info('SecondPage Back: fail ${err.code}')
          }
        })
      Text(this.title)
        .fontColor(Color.Red)
        .fontSize(25)
        .fontWeight(FontWeight.Bold)
    }
    .width('90%')
  }
}