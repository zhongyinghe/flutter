app版本说明
-----
```
1、在哪里设置版本号
2、信息说明
3、如何让其生效
```
##### 1、在哪里设置版本号
```
在pubspec.yaml文件中,就在下面中的version字段中设置app版本号
version: 1.0.0+1
```

##### 2、信息说明
```
version: 1.0.0+1
+前面是版本号,+后面是当前版本的build号;
例如: version: 1.0.0+1,版本号为:1.0.0,build号为1
如果我想升级版本号,可以这样:version: 1.0.1+1,这样版本号就升一个版本了
```

##### 3、如何让其生效
```
1、修改后执行flutter get
2、执行flutter clean
3、现在重新build 安装就能生效了
```
[版本说明参考](https://www.jianshu.com/p/3011c694d037)<br>
[版本修改后生效参考](https://blog.csdn.net/chiniyi7555/article/details/100724700)
