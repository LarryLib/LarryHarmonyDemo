// Basic implementation of IDataSource to handle data listener
class BasicIDataSource implements IDataSource {

  private listeners: DataChangeListener[] = [];
  public originDataArray: any[] = [];

  public totalCount(): number {
    return this.originDataArray.length;
  }

  public getData(index: number): any {
    return this.originDataArray[index];
  }

  // 该方法为框架侧调用，为LazyForEach组件向其数据源处添加listener监听
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  // 该方法为框架侧调用，为对应的LazyForEach组件在数据源处去除listener监听
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  // 通知LazyForEach组件需要重载所有子组件
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  // 通知LazyForEach组件需要在index对应索引处添加子组件
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  // 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  // 通知LazyForEach组件需要在index对应索引处删除该子组件
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }
}

export class CommonIDataSource extends BasicIDataSource {
  //  获取元素下标
  public getIndex(data: any) {
    return this.originDataArray.indexOf(data)
  }

  //  添加元素
  public pushData(data: any): void {
    this.originDataArray.push(data);
    this.notifyDataAdd(this.originDataArray.length - 1);
  }

  //  插入元素
  public addData(index: number, data: any): void {
    this.originDataArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  //  删除元素
  public deleteData(index: number): void {
    this.originDataArray.splice(index, 1);
    this.notifyDataDelete(index);
  }

  //  某元素改变
  public changeData(index: number, data: any): void {
    this.originDataArray.splice(index, 1, data);
    this.notifyDataChange(index);
  }

  //  全刷新
  public reloadData(): void {
    this.notifyDataReload();
  }

  //  改变所有元素
  public modifyAllData(): void {
    //  当element为字符串时
    this.originDataArray = this.originDataArray.map((item: string) => {
      return item + '0';
    })
  }
}
