@Entry
@Component
struct Index {
  @State answer: number = 0;
  @State inputValue: string = "";
  @State hintText: string = "开始猜 1~100 之间的数字";
  @State count: number = 0;
  @State gameOver: boolean = false;

  build() {
    Column() {
      Text("猜数字小游戏")
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 50, bottom: 20 });

      Text(this.hintText)
        .fontSize(18)
        .margin({ bottom: 20 })
        .width('90%')
        .textAlign(TextAlign.Center);

      TextInput({ text: this.inputValue, placeholder: "请输入数字" })
        .width('85%')
        .height(50)
        .backgroundColor(Color.White)
        .borderRadius(12)
        .margin({ bottom: 15 })
        .type(InputType.Number)
        .onChange((val) => {
          this.inputValue = val;
        });

      Button("确认猜测")
        .width('85%')
        .height(50)
        .backgroundColor(Color.Blue)
        .margin({ bottom: 10 })
        .onClick(() => {
          if (this.gameOver) return;

          let num = Number(this.inputValue);
          if (isNaN(num) || num < 1 || num > 100) {
            this.hintText = "请输入 1~100 的有效数字";
            return;
          }

          this.count++;
          if (num > this.answer) {
            this.hintText = "第" + this.count + "次：数字大了";
          } else if (num < this.answer) {
            this.hintText = "第" + this.count + "次：数字小了";
          } else {
            this.hintText = "🎉 猜对了！答案是" + num + "，共" + this.count + "次";
            this.gameOver = true;
          }
        });

      Button("重新开始")
        .width('100%')
        .height('100%')
        .backgroundColor('#FF6700')
        .onClick(() => {
          this.answer = Math.floor(Math.random() * 100) + 1;
          this.inputValue = "";
          this.hintText = "新游戏开始！1~100";
          this.count = 0;
          this.gameOver = false;
        });
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#fff5f3f1')
    .justifyContent(FlexAlign.Start)
    .onAppear(() => {
      this.answer = Math.floor(Math.random() * 100) + 1;
    });
  }
}
