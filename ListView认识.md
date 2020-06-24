ListView认识
-----

##### 1、反转认识
```
正常显示: 是从上往下显示,可见区为上

反转显示: 是从下往上显示,可见区为下
```
```
body: ListView.builder(
  reverse: true,//反转显示设置
  itemCount: items.length,
  itemBuilder: (BuildContext context, int index){
    return Text(items[index]);
  },
),
```
