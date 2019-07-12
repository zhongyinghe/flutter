import 'package:flutter/material.dart';
import 'package:area/data/Area.dart';
import 'package:area/model/area.dart';
class AreaSelectWidget extends StatefulWidget {
  AreaSelectWidget({
    this.initProvince = "",
    this.initCity = "",
    this.initCounty = "",
    this.initCode = "",
  });
  final String initProvince;
  final String initCity;
  final String initCounty;
  final String initCode;
  @override
  State<StatefulWidget> createState() => _AreaSelectState();
}

class _AreaSelectState extends State<AreaSelectWidget> {
  List<Area> _areaList = getAreaList(Areas);
  List<Area> _provinces;
  List<Area> _cities;
  List<Area> _counties;

  Area _selectedProvince;
  Area _selectedCity;
  Area _selectedCounty;

  int _selProvinceIndex = 0;
  int _selCityIndex = 0;
  int _selCountyIndex = 0;

  ScrollController _scrollProvince = ScrollController();
  ScrollController _scrollCity = ScrollController();
  ScrollController _scrollCounty = ScrollController();

  @override
  void initState() {
    super.initState();
    _provinces = _areaList;
    if(widget.initCode.isNotEmpty) {
      String provinceCode = widget.initCode.substring(0,2);
      String cityCode = widget.initCode.substring(0, 4);
      for(int i = 0; i < _areaList.length; i++) {
        Area area = _areaList[i];
        if(area.code == provinceCode) {
          _selectedProvince = area;
          _selProvinceIndex = i;//获取第几个省份被选中
          _cities = area.children;
          for(int j=0; j < area.children.length; j++) {
            Area cityArea = area.children[j];
            if(cityArea.code == cityCode) {
              _selectedCity = cityArea;
              _selCityIndex = j;//获取第几个城市被选中
              _counties = cityArea.children;
              for(int k=0; k<cityArea.children.length; k++) {
                Area countyArea = cityArea.children[k];
                if(countyArea.code == widget.initCode){
                  _selectedCounty = countyArea;
                  _selCountyIndex = k;//获取第几个县被选中
                  break;
                }
              }
              break;
            }
          }
          break;
        }
      }
    }else{
      if(_provinces.length > 0) {
        _selectedProvince = _provinces.first;
        if(_selectedProvince.children.length > 0) {
          _cities = _selectedProvince.children;
          _selectedCity = _cities.first;
          if(_selectedCity.children.length > 0) {
            _counties = _selectedCity.children;
            _selectedCounty = _counties.first;
          }
        }
      }
    }

    if(_selProvinceIndex > 14) {
      Future.delayed(const Duration(milliseconds:200), () {
        _scrollProvince.animateTo((_selProvinceIndex - 4)*40.0,
            duration: new Duration(seconds: 1), curve: Curves.ease);
      });
    }

    if(_selCityIndex > 14) {
      Future.delayed(const Duration(milliseconds:200), () {
        _scrollCity.animateTo((_selCityIndex - 4)*40.0,
            duration: new Duration(seconds: 1), curve: Curves.ease);
      });
    }

    if(_selCountyIndex > 14) {
      Future.delayed(const Duration(milliseconds:200), () {
        _scrollCounty.animateTo((_selCountyIndex - 4)*40.0,
            duration: new Duration(seconds: 1), curve: Curves.ease);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("请选择地址"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Map<String, String> rs = new Map();
              rs["province"] = _selectedProvince.name;
              rs["city"] = _selectedCity.name;
              rs["county"] = _selectedCounty.name;
              rs["code"] = _selectedCounty.code;
              Navigator.pop(context, rs);
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white10,
        child: Row(
          children: <Widget>[
            _buildProvince(),
            _buildCity(),
            _buildCounties(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _listBorder() => BoxDecoration(
      border: Border(right: BorderSide(color: Theme.of(context).dividerColor)));

  Widget _buildProvince() {
    return Expanded(
      child: Container(
        decoration: _listBorder(),
        child: ListView(
          itemExtent: 40.0,
          controller: _scrollProvince,
          children: _provinces.map((Area area){
            return _areaFlatButton(
              text: area.name,
              color: _selectedProvince.code == area.code ? Colors.black12: Colors.white10,
              onPressed: (){
                setState(() {
                  _selectedProvince = area;
                  _cities = area.children;
                  _selectedCity = _cities.first;
                  _counties =_cities.first.children;
                  _selectedCounty = _counties.first;
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCity() {
    return Expanded(
      child: Container(
        decoration: _listBorder(),
        child: ListView(
          itemExtent: 40.0,
          controller: _scrollCity,
          children: _cities.map((Area area){
            return _areaFlatButton(
              text: area.name,
              color: _selectedCity.code == area.code ? Colors.black12: Colors.white10,
              onPressed: (){
                setState(() {
                  _selectedCity = area;
                  _counties = area.children;
                  _selectedCounty = _counties.first;
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCounties() {
    return Expanded(
      child: Container(
        child: ListView(
          itemExtent: 40.0,
          controller: _scrollCounty,
          children: _counties.map((Area area){
            return _areaFlatButton(
              text: area.name,
              color: _selectedCounty.code == area.code ? Colors.black12: Colors.white10,
              onPressed: (){
                setState(() {
                  _selectedCounty = area;
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _areaFlatButton({String text, VoidCallback onPressed, Color color}) {
    return Container(
      height: 40.0,
      child: FlatButton(
        textColor: Color(0x8a000000),
        color: color,
        onPressed: onPressed,
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
