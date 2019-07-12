import 'package:flutter/material.dart';
import 'package:area/AreaSelectWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, String> _areaInfo = new Map();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("区域选择"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("选择地址"),
          onPressed: () async{
            _areaInfo = await Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => AreaSelectWidget(
                initProvince: "四川省",
                initCity: "成都市",
                initCounty: "崇州市",
                initCode: "510184",
              )),
            );
            if(_areaInfo != null) {
              print(_areaInfo);
            }
          },
        ),
      ),
    );
  }
}
