ListView嵌套
-----
##### 1、ListView嵌套Column
```
可以直接嵌套，也可以在Column外层包裹一层Container
具体可以参考: app的订单列表或者订单详情；也可以参考各种表单
```

##### 2、Column嵌套ListView
```
在listview外面嵌套一个expanded，或者一个container就可以了
```

##### 3、ListView嵌套一层ListView/GriedView等
```
new ListView(
  shrinkWrap: true,
  padding: EdgeInsets.all(0),
  children: <Widget>[
    new GridView.count(
   padding: EdgeInsets.all(0),
  physics: new NeverScrollableScrollPhysics(),//增加
  shrinkWrap: true,//增加
  crossAxisCount: 3,
  children:<Widget>[]
  ],
),
```
```
在GridView 添加shrinkWrap:true即可解决报错问题；
shrinkWrap: true,//增加
```
```
在 GridView 添加 physics: new NeverScrollableScrollPhysics()解决不滚动问题；
physics: new NeverScrollableScrollPhysics();
```
