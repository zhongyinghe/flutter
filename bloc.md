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
##### 1.3、 什么时候使用bloc,什么时候使用setState
```
    1)如果页面交互复杂就使用bloc;如果页面数据随时可能发生变化，请使用bloc
    2)如果页面加载了数据不变化，没有交互。那么在initState()方法中获取数据,然后再setState
    注意:凡有setState()的方法不能在build函数中调用
```
##### 1.4、使用bloc在build()方法中进行数据加载的方法
```
    1)增加属性isxxxInit = true
    2)在进行加载数据代码块后,isxxxInit = false,这样rebuild()后一般不进入数据加载代码块
    3)如果要想rebuild()重新进入数据加载代码块,可以使用eventBus,并在接受事件后把isxxxInit重新设置为true就可以
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
    解决方法
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
##### 3.2、bloc如何在多个类中保持同一个对象(指同一个页面)
```
    1)把bloc放在Stateful的属性中,其他类冒泡到这个类里执行bloc相应的方法
    2)把全部类都变为stateful类, bloc作为其属性, 这样在rebuild方法被调用时bloc不变
    3)把全部类都变为stateless类,这样rebuild方法被调用时所有的bloc对象被重新创建
    (注意: stateful和stateless尽量不要混合，否则容易造成bloc对象不一致)
```
##### 3.3、bloc如何在多个页面中保持同一个对象
```
    1)全局单列模式,这样可以保持同一对象
    2)可以考虑使用数据库或者文件来存储数据，或者重新发送网络请求
```
```
个人新解:
    全局性使用provider;2-3个页面共享一个bloc,则把这2-3个页面写为同一个页面,并使用冒泡的方法使用同一个bloc
```
##### 3.4、bloc如何和textfield共存
```
    可以参考3.1的理论解决方法
```
