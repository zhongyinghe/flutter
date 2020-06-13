http请求错误
-----
目录
```
错误信息
错误原因
解决方法
```

##### 1、错误信息
```
DioError [DioErrorType.DEFAULT]: HttpException: Connection closed before full header was received
```

##### 2、错误原因
```
数据库中的一张表缺少一个字段，造成插入数据失败,从而引起http响应错误
```

##### 3、解决方法
```
补全数据表的字段,让插入数据顺利进行
```
