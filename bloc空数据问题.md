bloc空数据问题
-----
###### 目录
```
发生过程

问题

原因

解决方法
```
##### 1、发生过程
```
从当前列表页跳到编辑页，然后返回当前列表页，则当前列表页的数据为空
```

##### 2、问题 
```
List<RcvdEps> rcvdEpsList = snapshot.data;
allRcvdEpsList = rcvdEpsList;

然后在一个函数中使用:
allRcvdEpsList.clear()

则整个页面的数据将为空
```

##### 3、原因
```
我的猜测解释:
snapshot.data直接赋值的变量，类似于传的是地址,所以最后allRcvdEpsList.clear()相当于把snapshot.data给清空了
```

##### 4、解决方法
```
不要让allRcvdEpsList调用clear()方法,即不要使用allRcvdEpsList.clear();
其他list对象可以，唯独直接使用snapshot.data赋值的变量不行,间接赋值都不行,如上面
```
