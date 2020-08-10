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

git的安装要注意有个地方的勾选: https://www.jianshu.com/p/a5a35fd890df
在最后那里的勾选
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
##### 3、安装android studio
```
步骤一:
安装好android studio和android SDK后
新增环境变量: 
ANDROID_HOME = D:\xxx\androidsdk 
系统环境变量path中添加:
%ANDROID_HOME%\build-tools
%ANDROID_HOME%\tools
%ANDROID_HOME%\platform-tools

步骤二:在setting->Plugins->搜索Dart插件和flutter插件并安装
(1)先在System Setting的HTTP Proxy中设置插件地址: https://plugins.jetbrains.com/
这就要勾选: Auto-detect proxy settings; 接着勾选: Automatic proxy configuration URL
接着填: https://plugins.jetbrains.com/

(2)在setting->Plugins->搜索Dart插件和flutter插件并安装

(3)配置Dart sdk和flutter sdk位置
在lange和framework那里配置

步骤三: 创建项目:File -> New -> New Flutter Project

```

### 问题
##### 1、问题: flutter命令卡主
```
在flutter目录中使用: git pull
错误信息如下:
fatal: unable to access 'https://github.com/flutter/flutter.git/': OpenSSL SSL_read: Connection was reset, errno 10054

解决方法: 在flutter目录下使用git: git config http.sslVerify "false"
```
[其他flutter命令卡住的解决方法](https://www.cnblogs.com/Grewer/p/12317848.html)
