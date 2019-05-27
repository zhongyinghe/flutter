Form和TextField
-----
目录
```
一、基本使用
二、监听
三、认识
四、问题
```
### 一、基本使用
##### 1、布局
```
    1)ListView布局
    2)缩进设置
    3)开头提示语prefixIcon
    4)TextField的输入类型
```
##### 2、点击提交
```
    1)验证检测
    2)发送请求
    3)处理请求结果
```
### 二、监听
```
    1)监听值的变化
    2)监听角度的获取与失去
```
### 三、认识
```
    当弹出软键盘时，整个页面都会进行重建，
    确认✔是也会重建整个页面
```
### 四、问题
```
    1)Row中使用TextField问题。如果报错，请使用Expanded包裹TextField
    
    2)如果一行中有多个元素，其中一个为TextField.若要居中，则使用autocorrect = true来自动更正
    
    3)在✔设置的方式:TextInputAction: TextInputAction.done
    
    4)关于TextField有个线框包围的设置
        decoration: InputDecoration(
            hintText: '限150字（若有特殊需求，请联系商城在线客服)',
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            ),
        ),
    5)boder线框如何缩小:使用InputDecoration中的ContentPadding来设置    
```
