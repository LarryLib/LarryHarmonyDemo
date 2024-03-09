import router from '@ohos.router'

@Entry
@Preview
@Component
struct FirstPage {
  @State message: string = 'FirstPage'
  @State src: string = 'ok' //  接受传递的参数

  build() {
    Row() {
      Column({ space: 30 }) {
        //  文本
        Text(this.message)
          .fontColor(Color.Red)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        //  其他页面传来的参数
        if (this.src.length > 0) {
          Text(this.src)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }

        Btn()

        //  按钮
        Button('pushUrl')
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          })
          .backgroundColor('#0D9FFB')
          .width('50%')
          .height('5%')
          .onClick(() => {
            console.info('FirstPage click PushButton')
            router.pushUrl({
              url: 'pages/PageLifeCycle/SecondPage',
              params: {
                src: 'FirstPage传参hahhaha'
              }
            }, router.RouterMode.Standard)// 路由模式：router.RouterMode.Standard（默认）、router.RouterMode.Single
              .then(() => {
                console.info('FirstPage Push to SecondPage: success')
              })
              .catch(() => {
                console.error('Push to second: fail')
              })
          })

        //  按钮
        Button('replaceUrl')
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          })
          .backgroundColor('#0D9FFB')
          .width('50%')
          .height('5%')
          .onClick(() => {
            console.info('FirstPage click PushButton')
            router.replaceUrl({
              url: 'pages/PageLifeCycle/SecondPage',
              params: {
                src: 'FirstPage传参hahhaha'
              }
            }, router.RouterMode.Standard)// 路由模式：router.RouterMode.Standard（默认）、router.RouterMode.Single
              .then(() => {
                console.info('FirstPage Push to SecondPage: success')
              })
              .catch(() => {
                console.error('Push to second: fail')
              })
          })
      }
      .width('100%')
    }
    .height('100%')
  }

  //
  aboutToAppear() {
    console.info('FirstPage aboutToAppear')
  }

  onPageShow() {
    console.info('FirstPage onPageShow')
    // this.src = (router.getParams() as Record<string, string>)['src'];
  }

  onPageHide() {
    console.info('FirstPage onPageHide')
  }

  onBackPress() {
    console.info('FirstPage onBackPress')
  }

  aboutToDisappear() {
    console.info('FirstPage aboutToDisappear')
  }

  // onLayout() {
  //   console.info('FirstPage onLayout')
  // }
  //
  // onMeasure() {
  //   console.info('FirstPage onMeasure')
  // }
  //
  // pageTransition() {
  //   // console.log('FirstPage pageTransition')
  // }
}

@Component
struct Btn {
  build() {
    Row() {
      Text('自定义组件')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
    }
  }

  //
  aboutToAppear() {
    console.info('Btn aboutToAppear')
  }

  onPageShow() {
    console.info('Btn onPageShow')
  }

  onPageHide() {
    console.info('Btn onPageHide')
  }

  onBackPress() {
    console.info('Btn onBackPress')
  }

  aboutToDisappear() {
    console.info('Btn aboutToDisappear')
  }
}