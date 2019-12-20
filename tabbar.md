TabBar和TarBarView的认识
-----
目录
```
    1、认识
    2、造成的问题
    3、解决方法
```
##### 1、认识
```
    切换tabbar来切换页面，则TabBarView的子widget会重新创建(即会重新调用initState()方法),每切换一次，就会重新创建一次;
    如果从最后一个直接切换到第一个，则会连续创建几个页面(由实验可知)
```
##### 2、造成的问题
```
    如果每切换一次,TabBarView的子widget重新创建一次,则子widget若发生http请求,则每切换一次，就重新发送请求一次。
    这样会频繁地发送http请求
```
##### 3、解决方法
1)方法一:不要在TabBarView的子widget中发送http请求
```
先发送http请求，拿到数据后，再使用TarBarView来显示数据
```
2)方法二:使用IndexedStack
```
TabBar(
    tabs: tabTitles.map((tabTitle) => Tab(child: Text(tabTitle, style: TextStyle(fontSize: 18.0)))).toList(),
    controller: _tabController,
    onTap: (int index) {
        setState(() {
          _tabIndex = index;
        });
    },
),
```
```
void initData() {
    _body = IndexedStack(
      children: <Widget>[
        
      ],
      index: _tabIndex,
    );
}
```
```
注意问题: 在页面切换后回来时IndexedStack内的child Widget不会重新调用initState()方法，但是会调用build方法;
所以切换回来后,若http请求放在child Widget的initState中调用，它是不会重新发送http请求的,但页面会重新构建(实验可知)
```
