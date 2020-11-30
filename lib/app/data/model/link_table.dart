import 'package:araci/app/data/model/model_table.dart';

class Link extends Model{
  int link;
  String url;
  int nodeId;

  @override
  String TABLE_NAME = "Link";

  Link();

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "url": url,
      "node_id": nodeId
    };
    if (link != null) {
      map["link"] = link;
    }
    return map;
  }

  @override
  Model fromMap(Map<String, dynamic> map) {
    link = map["link"];
    url = map["url"];
    nodeId = map["node_id"];
  }

  @override
  List<Model> makeModels(List<Map> maps) {
    List<Link> fData = [];
    maps.forEach((map){
      fData.add(Link().fromMap(map));
    });
    return fData;
  }
}