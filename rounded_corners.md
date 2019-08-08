圆角
-----
##### 1、输入框圆角
```
Widget _messageField() => Padding(
  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
  child: TextField(
    controller: _messageCtrl,
    autocorrect: true,
    maxLines: 3,
    textInputAction:TextInputAction.done,
    decoration: InputDecoration(
      hintText: '限150字',
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
    ),
  ),
);
```
##### 2、显示文本圆角
```
@override
Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double realWidth = width - 20;
  return Padding(
    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
    child: Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      width: realWidth,
      height: 80.0,
      child: tip.isEmpty ? _getChild() : _getTipChild(),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: new BorderRadius.all(const Radius.circular(5.0)),
      ),
    ),
  );
}

Widget _getChild() {
  return Text(
    content,
    style: TextStyle(fontSize: 18.0),
  );
}
```
##### 3、按钮圆角
```
Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double btnWidth = width - 20.0;
  return InkWell(
    onTap: callback,
    child:  new Container(
      width: btnWidth,
      height: 50.0,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: AnbColors.bigBtnColor,
        borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
      ),
      child: new Text(
        text,
        style: new TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    ),
  );
}
```
```
Widget build(BuildContext context) {
  return  Container(
    child: RaisedButton(
      onPressed: (){
        callback();
      },
      color: bgColor,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: bgColor),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Text(
        btnTxt,
        style: TextStyle(fontSize: 18.0),
      ),
    ),
  );
}
```
##### 4、头像圆角
```
Widget _getAvatar(String avatar) {
  return Container(
    width: 80.0,
    height: 80.0,
    decoration: new BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.transparent,
      image: new DecorationImage(
          image: new NetworkImage(avatar), fit: BoxFit.cover),
      border: new Border.all(
        color: Colors.white,
        width: 2.0,
      ),
    ),
  );
}
```
##### 5、图片圆角
```
Container(
  width: 200,
  height: 100,
  decoration: BoxDecoration(
      color: Colors.red
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Image.asset('images/jicheng.png'),
  )
),
```
```
Container(
  width: 200,
  height: 100,
  decoration: BoxDecoration(
      color: Colors.red
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: FadeInImage.assetNetwork(
        placeholder: 'images/jicheng.png',
        image: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558521166075&di=d1a864cdaa9a9161f16b578363d74894&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farticle%2Fcbf456b1d2b8a6556ec38cb5bad3ece0cc549ef5.jpg',
        fit: BoxFit.cover,
    ),

  )
),
```
