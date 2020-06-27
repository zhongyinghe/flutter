setState错误
-----
```
目录
    1、错误信息
    2、解决方法
```
##### 1、错误信息
```
[ERROR:flutter/lib/ui/ui_dart_state.cc(166)] Unhandled Exception: setState() called after dispose()
```

##### 2、解决方法
```
#只需在调用setState()之前检查您的窗口小部件的状态类 mounted 的属性。除非 mounted 为true，否则调用setState是错误的。
#具体代码为:
if (this.mounted){
 setState((){
  //Your state change code goes here
 });
}
```
[参考链接](https://www.uedbox.com/post/65064/)
