###### 目录
```
背景

解决方法
```

##### 1、背景
```
我升级flutter版本和android studio版本后,as链接不了模拟器,它提示下载Windows Universal C Runtime;
但是我下载不了
```

##### 2、解决方法
```
1、切换到D:\xxx\xxx\platform-tools\目录
```
```
2、执行如下命令:
adb start-server

它报缺少api-ms-win-crt-private-l1-1-0.dll文件
```
```
3、下载api-ms-win-crt-private-l1-1-0.dll文件,并放到C:\Windows\SysWOW64\目录下
注: 64位的dll文件都放到这里吗?主要还是要看使用说明
```
### 让adb重新启动，以便链接上设备的方法
```
#以root权限重启adb
adb root
```
### 检测错误
```
adb nodaemon server
```
[参考](https://www.jianshu.com/p/689aed65364c)
