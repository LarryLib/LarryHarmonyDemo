import { arkTS } from './ArkTS';
import { arkTSBaseGrammar } from './ArkTSBaseGrammar';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Text('arkTSBaseGrammar')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          arkTSBaseGrammar()
        })

      Text('arkTS')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          arkTS()
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}