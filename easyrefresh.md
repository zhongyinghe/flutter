flutter_easyrefresh的认识
-----
```
loadMore: () async {
  //内部一定要按顺序执行
  //若发生http请求,则要使用await
  await httpRequest()
  //若httpRequest()内部有异步请求，则又要使用await让其顺序执行
  //这样setState()才能够正确反映是否加载了数据
}
```
