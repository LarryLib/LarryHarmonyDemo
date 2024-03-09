@Entry
@Component
struct BuilderParamPage {
  label: string = `Parent`

  @Builder componentBuilder() {
    Text(`${this.label}`)
  }

  build() {
    Column() {
      this.componentBuilder()
      Child({ aBuilder0: this.componentBuilder })
    }
  }
}

@Component
struct Child {
  label: string = `Child`
  @BuilderParam aBuilder0: () => void;

  build() {
    Column() {
      this.aBuilder0()
    }
  }
}