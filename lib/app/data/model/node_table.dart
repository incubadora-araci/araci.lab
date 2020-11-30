import 'package:araci/app/data/model/model_table.dart';

class Node extends Model{
  int node; // PK "node"	integer NOT NULL,
  int title;// "title"	varchar(255) DEFAULT NULL,
  int content; // "content"	text,

  @override
  String TABLE_NAME = "Node";

  Node();

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "title": title,
      "content": content,
    };
    if (node != null) {
      map["node"] = node;
    }
    return map;
  }

  @override
  Model fromMap(Map<String, dynamic> map) {
    node = map["node"];
    title = map["title"];
    content = map["content"];
}

  @override
  List<Model> makeModels(List<Map> maps) {
    List<Node> fData = [];
    maps.forEach((map){
      fData.add(Node().fromMap(map));
    });
    return fData;
  }
}