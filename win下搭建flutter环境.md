win下搭建flutter环境
-----
##### 1、安装java环境
```
安装完java环境后,新增环境变量:
JAVA_HOME, 它的值为: c:\java8

在Path环境变量中添加如下值:
%JAVA_HOME%\bin
```

##### 2、搭建flutter环境
```
因为flutter依赖:
Windows PowerShell 5.0 或者更高的版本;
git;

所以先安装Windows PowerShell和git
```
```
开始安装flutter:
步骤一: 使用git克隆flutter进本地目录(不要在C盘)
git clone -b beta https://github.com/flutter/flutter.git

步骤二: 配置环境变量
PUB_HOSTED_URL = https://pub.flutter-io.cn
FLUTTER_STORAGE_BASE_URL = https://storage.flutter-io.cn

步骤三: 在Path环境变量中添加: Path :D:\xxxx\flutter\bin

步骤四: 安装依赖
flutter doctor
```
