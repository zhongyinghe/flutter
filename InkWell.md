InkWell无效问题
-----
##### 目录
```
  问题
	
  原因
	
  解决方法
```
##### 1、问题
```
问题:使用InkWell没有水纹波
```
##### 2、原因
```
原因是:问题其实出在了Container上，InkWell其是Material组件。使用Containe的效果其实是盖住了Inkwell
而不是给InkWell设置了背景色
```
##### 3、解决方法
```
在InkWell的外层再套上Matetial 以及 Ink组件
```
```
Material(
  child: Ink(
    child:InkWell(
        onTap: () { },
        child: Container(
           height: 50.0,
           color: Colors.white,
           child: Text( "是速度",
               maxLines: 1,
               style: TextStyle(color: color),
               overflow: TextOverflow.ellipsis,
               ),
        ),
      ),
    ),
)
```
