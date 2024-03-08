import AppContext from '@ohos.app.ability.common';
import router from '@ohos.router';
import { TitleBarStyle } from '../../constants/Constants';

@Entry
@Component
struct SecondPage {
  @State src: string = (router.getParams() as Record<string, string>)['src'];
  @State message: string = 'Second Page'

  build() {
    Column({ space: 20 }) {
      Row() {
        Image($r('app.media.ic_public_back'))
          .height(TitleBarStyle.IMAGE_BACK_SIZE)
          .width(TitleBarStyle.IMAGE_BACK_SIZE)
          .margin({ right: TitleBarStyle.IMAGE_BACK_MARGIN_RIGHT })
          .onClick(() => {
            // this.back()
            let handler = getContext(this) as AppContext.UIAbilityContext;
            handler.terminateSelf();
          })
        Text(this.message)
          .fontColor(Color.Red)
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .width('90%')

      Text(this.src)
        .fontSize(25)
        .fontWeight(FontWeight.Bold)
      Button() {
        Text('Back')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .type(ButtonType.Capsule)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .width('40%')
      .height('5%')
      .onClick(() => {
        console.info('SecondPage Click BackButton')
        this.back()
      })
    }
    .width('100%')
  }

  back() {
    try {
      //  返回指定页面
      // router.back({ url: 'pages/Index' });
      router.back({
        url: 'pages/PageLifeCycle/FirstPage',
        params: {
          src: 'SecondPage传递的参数'
        }
      })
      console.info('SecondPage Back: Success')
    } catch (err) {
      console.info('SecondPage Back: fail ${err.code}')
    }
  }

  //
  aboutToAppear() {
    console.info('SecondPage aboutToAppear')
  }

  onPageShow() {
    console.info('SecondPage onPageShow')
  }

  onPageHide() {
    console.info('SecondPage onPageHide')
  }

  onBackPress() {
    console.info('SecondPage onBackPress')
  }

  aboutToDisappear() {
    console.info('SecondPage aboutToDisappear')
  }

  // onLayout() {
  //   console.info('SecondPage onLayout')
  // }
  //
  // onMeasure() {
  //   console.info('FirstPage onMeasure')
  // }
  //
  // pageTransition() {
  //   // console.info('FirstPage pageTransition')
  // }
}