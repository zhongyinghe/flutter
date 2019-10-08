关于ScrollController的认识
-----
### 1、注解
```
_scrollController.position.maxScrollExtent 底部
```
```
_scrollController.position.pixels 当前位置
```
```
_scrollController.offset 当前位置

_scrollController.position.pixels == _scrollController.offset
```
```
距离底部有多远
double offsetFromBottom = _scrollController.position.maxScrollExtent - _scrollController.position.pixels;
```
```
滚动到指定位置;它不是滚动多少距离,而是滚动到指定位置
_scrollController.animateTo(
_scrollController.offset - (edge -offsetFromBottom),
duration: new Duration(milliseconds: 500),
curve: Curves.easeOut);
```
[参考](https://book.flutterchina.club/chapter6/scroll_controller.html)
