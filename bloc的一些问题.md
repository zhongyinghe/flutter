bloc的一些问题
-----
### 1、bloc在使用了Navigator.pushAndRemoveUntil后的问题
```
1、错误日志
在使用Navigator.pushAndRemoveUntil后回到首页,调用bloc的方法进行统计.则报如下错误:
[ERROR:flutter/lib/ui/ui_dart_state.cc(148)] Unhandled Exception:
```
```
2、原因分析:
是因为bloc已经关闭了，仍然进行bloc的add操作
```
```
3、解决方法:
判断bloc是否关闭了
if(!bloc.isClosed){
    //处理逻辑
}
```
