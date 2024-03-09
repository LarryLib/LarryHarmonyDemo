import { CommonIDataSource } from './CommonIDataSource';

@Observed
class PersonModel {
  name: string
  message: string
  constructor(name: string, message: string) {
    this.name = name
    this.message = message
  }
}

@Entry
@Component
struct LazyForEachRenderPage {
  @State persons: CommonIDataSource = new CommonIDataSource();

  personsChanged() {

  }

  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.persons.pushData(new PersonModel(`Larry ${i}`, `Hello ${i}`));
    }
  }

  build() {
    Column() {
      Row() {
        // Text((this.persons.getData(0) as PersonModel).message)
        Text(`${this.persons.originDataArray.length}`)
        Text('改变Data(0)')
          .onClick(() => {
            let data = this.persons.getData(0) as PersonModel
            data.message += 'f'
            this.persons.changeData(0, data)
          })
      }
      .justifyContent(FlexAlign.SpaceEvenly)
      .height(100)
      .width('100%')
      .backgroundColor('#eeeeee')

      // List({ space: 3 }) {
      //   LazyForEach(this.data, (item: PersonModel, index: number) => {
      //     ListItem() {
      //       ChildComponent({data: item})
      //     }
      //     .onClick(() => {
      //       console.info(`index = ${index}`)
      //       item.message += '0';
      //     })
      //   }, (item: PersonModel, index: number) => index.toString())
      // }
      // .height(200)
      // .cachedCount(5)

      List({ space: 3 }) {
        LazyForEach(this.persons, (person: PersonModel, index: number) => {
          ListItem() {
            ChildComponent({person: person!})
          }
          .onClick(() => {
            //  增
            // this.data.pushData(`new hello ${this.data.totalCount()}`)

            //  插入
            // this.data.addData(1, `new hello ${this.data.totalCount()}`)

            //  删
            this.persons.deleteData(this.persons.getIndex(person))

            //  改
            // this.data.changeData(index, item + '00');

            //  改多个，然后reloadData
            // this.data.modifyAllData();
            // this.data.reloadData();

            // console.info(`index = ${index}`)
            // item.message += '0';
          })
        }, (item: PersonModel, index: number) => index.toString())
      }
      .backgroundColor('#eeeeee')
      .cachedCount(5)
    }
  }
}

@Component
struct ChildComponent {
  @ObjectLink person: PersonModel

  build() {
    Row() {
      Text(this.person.name).fontSize(30)
        .onClick(() => {
          this.person.name += 'n'
        })
      Text(this.person.message).fontSize(30)
        .onClick(() => {
          this.person.message += 'm'
        })
    }
    .margin({ left: 10, right: 10 })
    .justifyContent(FlexAlign.SpaceAround)
    .width('100%')
  }
}