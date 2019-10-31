flutter版本回退方法
-----
###### 目录
```
背景

方法
```
##### 1、背景
```
我把flutter升级到最新版本,发现run不了,报一堆错误;它报错就是因为我升到最新版本,为了解决错误,我决定回退到指定的版本.

注: flutter的sdk升级后报错了，把相应的包也升级也解决不了问题,因为sdk版本的问题
```

##### 2、解决方法
```
1、去到https://github.com/flutter/flutter中
```
```
2、点击releases,跳到https://github.com/flutter/flutter/releases
```
```
3、选择恰当的版本,如: v1.9.1+hotfix.6; 点击它的哈希值，跳到
https://github.com/flutter/flutter/commit/68587a0916366e9512a78df22c44163d041dd5f3
```
```
4、在flutter sdk目录(如:我的目录为D:\flutter\flutter)中执行如下命令:
git reset --hard 68587a0916366e9512a78df22c44163d041dd5f3
```
```
5、执行flutter doctor命令
```
[参考](https://www.jianshu.com/p/231d141ac8c4)
