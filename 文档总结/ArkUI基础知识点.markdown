# ArkTS基础知识（ArkTS）

## Ability生命周期（见：EntryAbility）
- onCreate
- onForeground
- onBackground
- onDestroy

## 自定义组件生命周期(见：PageLifeCycle)
#### FirstPage出现
- 【FirstPage aboutToAppear
- 【FirstPage】 onPageShow

#### FirstPage push SecondPage
- FirstPage click PushButton
- FirstPage Push to SecondPage: success
- 【SecondPage】 aboutToAppear
- 【FirstPage】 onPageHide
- 【SecondPage】 onPageShow

#### SecondPage pop FirstPage
- SecondPage Click BackButton
- SecondPage Back: Success
- 【SecondPage】 onPageHide
- 【FirstPage】 onPageShow
- 【SecondPage】 aboutToDisappear
