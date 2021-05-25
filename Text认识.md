Text认识
-----
##### 1、关于Text的overflow认识
```
overflow就是: 如何处理文本溢出问题;它有三个值:
TextOverflow.clip  剪切溢出的文本
TextOverflow.ellipsis  使用省略号表示文本已溢出
TextOverflow.fade  将溢出的文本淡化为透明
```
[详细说明在这里](https://blog.csdn.net/chenlove1/article/details/84574651)

##### 2、如何让溢出处理有效
```
方法一: 在Text()的外面使用Expanded()包裹,如:
Expanded(
    child: Text("", overflow: TextOverflow.ellipsis,maxLines: 1,)
);
```
```
方法二: 在外面设置固定的宽度，才能显示省略号
```
[参考说明](https://blog.csdn.net/weixin_38025168/article/details/116229498)
