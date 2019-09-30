app内下载更新问题
-----
```
目录:
    1、背景
    2、错误信息
    3、原因
    4、解决方法
```
##### 1、背景
```
我要实现app内下载并更新app,我使用的flutter_downloader插件
```
##### 2、错误信息
```
W/System.err(16081): java.io.IOException: Cleartext HTTP traffic to **** not permitted
```
##### 3、原因
```
在发送HTTP请求时，内容没有加密处理，网络请求被驳回。
而HTTPS请求则没有这种权限设置，所以直接将URL中的"http://"改为"https://"就可以完美避免这个问题。
```
##### 4、解决方法
```
方法一:
    所以直接将URL中的"http://"改为"https://"就可以完美避免这个问题
```
```
方法二:
    让请求支持http
    
    步骤一:
    在 res 下新增一个 xml 目录，然后创建一个名为：network_security_config.xml 文件（名字自定）,
    内容如下，大概意思就是允许开启http请求
```
```
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <base-config cleartextTrafficPermitted="true" />
</network-security-config>
```
```
    步骤二:
    然后在APP的AndroidManifest.xml文件下的application标签增加以下属性
```
```
<application
...
 android:networkSecurityConfig="@xml/network_security_config"
...
/>
```

[参考](https://blog.csdn.net/weixin_43526279/article/details/100574799)
