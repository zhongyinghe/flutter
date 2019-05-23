bloc
-----
### 1、加载初始化数据的问题
##### 1.1、在build()方法中加载数据-setState
```
在build函数中使用函数获取数据,然后使用setState()进行rebuild,则会进入无限获取数据的过程
```
##### 1.2、在build()方法中使用bloc加载数据的问题
```
发生过程: 在 build函数中发送http请求，根据请求结果判断是否要跳转到登录页面;由于没有登录，
所以它就跳转到登录页面，并且是无限循环的
```
```
发生的原因: 暂不知
```
```
解决方法: 不要在build函数发送的http请求函数中判断用户是否登录(即可以发生http请求,但不判断用户是否登录，进而跳转)
	那么在哪里判断是否已经登录呢?在页面跳转前进行判断,已经登录了才跳转，没登录则跳到登录页
```
```
总结: 不要在构建页面的函数中进行新的页面跳转,否则无限循环
```
### 2、关于bloc空数据问题
```
目录:
	错误日志	
	原因	
	解决方法
```
```
1)、错误日志
2019-03-06 09:43:15.910 20755-20775/com.anb.www.anb I/flutter: ══╡ EXCEPTION CAUGHT BY WIDGETS LIBRARY ╞═══════════════════════════════════════════════════════════
2019-03-06 09:43:15.926 20755-20775/com.anb.www.anb I/flutter: The following NoSuchMethodError was thrown building StreamBuilder<User>(dirty, state:
2019-03-06 09:43:15.926 20755-20775/com.anb.www.anb I/flutter: _StreamBuilderBaseState<User, AsyncSnapshot<User>>#e3296):
2019-03-06 09:43:15.926 20755-20775/com.anb.www.anb I/flutter: The getter 'avatar' was called on null.
2019-03-06 09:43:15.926 20755-20775/com.anb.www.anb I/flutter: Receiver: null
2019-03-06 09:43:15.926 20755-20775/com.anb.www.anb I/flutter: Tried calling: avatar
2019-03-06 09:43:15.926 20755-20775/com.anb.www.anb I/flutter: When the exception was thrown, this was the stack:
```
```
2)、原因
原因是:在设置初始化数据时为null,它先建立页面时使用的user对象为null,所以造成了user空对象
```
```
3)、解决方法
	既然初始化数据为null,是不能使用user对象的，那么就判断对象是否为null;若为null则不使用
```
### 3、bloc的注意事项
##### 3.1、关于bloc和textfield一起使用应当注意的事项
```
目录:
    论点
    结论
    理由
```
```
结论:
    bloc对象尽量不要和TextField用在一起，否则会破坏bloc对象
```
```
理由:
    当点击textfield要输入内容时,textField会造成widget rebuild整个页面(这个rebuild会追溯哦到scaffold),
    这样bloc对象就会不断地变化
```
```
解决方法:
    在有TextField情况下尽量不要使用bloc
    或者在initState中使用bloc对象，这样可以保持同一对象(把bloc对象作为StatefulWidget的属性)
```
