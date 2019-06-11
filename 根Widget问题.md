根Widget问题
-----
### 目录
```
    报错日志
    
    原因分析
    
    解决方法
```
##### 1、报错日志
```
I/flutter (31817): ══╡ EXCEPTION CAUGHT BY GESTURE ╞═══════════════════════════════════════════════════════════════════
I/flutter (31817): The following assertion was thrown while handling a gesture:
I/flutter (31817): Navigator operation requested with a context that does not include a Navigator.
I/flutter (31817): The context used to push or pop routes from the Navigator must be that of a widget that is a
I/flutter (31817): descendant of a Navigator widget.
```
##### 2、原因分析
```
在MaterialApp所在的类中,是不能够使用Navigator.push(),一使用就报上面的错误.也不能够获取屏幕的宽，否则也报这样的错误
```
##### 3、解决方法
```
In this situation, the easiest solution is to introduce a new widget as child of MaterialApp. 
And then use that widget's context to do the Navigator call.

也就是不要在在MaterialApp所在的类中使用有关的context,可以创建子类的方式来避免这个问题
````
