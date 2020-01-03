TextField认识
-----
##### 1、无装饰线设置
```
child: TextField(
  controller: _inputCtrl,
  style: TextStyle(fontSize: 18.0),
  decoration: InputDecoration.collapsed( //无装饰线设置
    hintText: '输入你要咨询的信息...',
    hintStyle: TextStyle(color: Color(0xffaeaeae), fontSize: 18.0),
  ),
),
```
[可以参考装饰线设置方法](https://www.jianshu.com/p/54419a143d70)
