SingleChildScrollView和Sliver比较
-----
##### 1、Sliver认识
```
通常可滚动组件的子组件可能会非常多，占用的总高度也会非常大，如果要一次性将子组件全部构建出将会导致性能差的问题出现，
为此，Flutter中提出一个Sliver（中文为"薄片"的意思）概念，
如果一个可滚动组件支持Sliver模型，那么该滚动组件可以将子组件分成好多个薄片（Sliver），
只有当Sliver出现在视口时才会去构建它，这种模型也成为"基于Sliver的延迟构建模型"。
可滚动组件中有很多都支持基于Sliver的延迟构建模型，如ListView、GridView，
但是也有不支持该模型的，如SingleChildScrollView
```
```
个人评价: 可见的创建,不可见的销毁;"生灭"之中

使用在产品详情页中，则是个错误，经常造成图片之间有裂缝,应当改用SingleChildScrollView
```

##### 2、SingleChildScrollView认识
```
它就是直接加载，一次性加载完成,没有"可见时创建，不可见时销毁"，这样它非常适合用来显示图片(完整图片被切割成多份)，
不会造成图片的裂痕;

它主要应用于产品详情页中的图片详情
```
[参考](https://www.cnblogs.com/upwgh/p/11419310.html)

