dio支持https证书
-----
##### 目录
```
背景
解决方法
判断证书的编码格式
```
### 1、背景
```
我在服务端使用了https;在flutter的app使用https请求是报错的
```
### 2、解决方法
```
Dio dio = new Dio();
String myPem = _getPem();//_getPem()返回我的公钥，不要私钥
(dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
  client.badCertificateCallback = (X509Certificate cert, String host, int port){
    if(cert.pem == myPem) {
      return true;
    }
    return false;
  };
};
```
### 3、判断证书的编码格式
```
PEM - Privacy Enhanced Mail,打开看文本格式,以"-----BEGIN..."开头, "-----END..."结尾,内容是BASE64编码.

DER - Distinguished Encoding Rules,打开看是二进制格式,不可读.
```
