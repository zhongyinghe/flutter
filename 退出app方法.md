退出app方法
-----
##### 1、引入包
```
import 'package:flutter/services.dart';
```

##### 2、使用如下方法
```
SystemNavigator.pop();
#或者
await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
```
