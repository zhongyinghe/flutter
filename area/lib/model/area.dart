import 'package:json_annotation/json_annotation.dart';

part 'area.g.dart';


List<Area> getAreaList(List<dynamic> list){
  List<Area> result = [];
  list.forEach((item){
    result.add(Area.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class Area extends Object {

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'children')
  List<Area> children;

  Area(this.code,this.name,this.children,);

  factory Area.fromJson(Map<String, dynamic> srcJson) => _$AreaFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AreaToJson(this);

}