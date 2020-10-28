TextField内容被清除问题
-----
```
产生条件
原因
解决方法
```
##### 1、产生条件
```
当ListView滚动时,TextField滚出界面后,ListView滚动回顶部,再滚动到TextField那里(即TextField滚出屏幕再滚入屏幕);
TextField的内容被清除了

发生地方: 后台app,取消订单管理中,审核取消订单的表单;这地方就出现了这样的问题
```

##### 2、原因
```
TextField是独立Widget类,ListView对Item的显示是: 可以显示的创建，不可显示的销毁(生灭);
当TextField滚出界面时,TextField所在的类就被销毁,当再次滚动到TextField时，TextField的类被重新创建,
这样原先在TextField的输入内容就会被清除
```

##### 3、解决方法
```
把TextField封装成一个StatefulWidget，然后用AutomaticKeepAliveClientMixin来保证TextField不会被回收。核心代码如下
```
```
class _TextFieldWidgetState extends State<TextFieldWidget> with AutomaticKeepAliveClientMixin  {//关键代码：AutomaticKeepAliveClientMixin保存状态
  Function callback;
  String title;
 
  @override
  bool get wantKeepAlive => true; //关键代码：重写get wantKeepAlive并设置为true
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
 
  @override
  Widget build(BuildContext context)  {
 
    return TextField(
      inputFormatters: [PrecisionLimitFormatter(2)],
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
        labelText: widget.title, // 文字提示
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true, // 是否填充背景
        fillColor: Colors.white, // 填充颜色
      ),
      style: TextStyle(fontSize: ScreenUtil().setSp(TextStyleManager.TextEditSize),color: TextStyleManager.NumColor),//输入文本的样式
      onChanged: (value){
        widget.callback(value);
      }, // 当点击确定时调用的函数2
    );
  }
}
```
[参考链接](https://blog.csdn.net/pw2009eve/article/details/108364651)
