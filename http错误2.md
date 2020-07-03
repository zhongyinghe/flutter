关于请求错误
-----
```
目录
   错误信息
   错误原因
   解决方法 
```
##### 1、错误信息
```
CERTIFICATE_VERIFY_FAILED: Hostname mismatch(handshake.cc:354))
```

##### 2、错误原因
```
url不生效，即api的根URL错误
```

##### 3、解决方法
```
修正根url,把api.xxx.com变为www.xxx.com
因为自己的域名只能使用一个
```
