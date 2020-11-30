import 'package:araci/app/data/model/model_table.dart';

class Article extends Model{
  int id; // PK "node"	integer NOT NULL,
  String title;// "title"	varchar(255) DEFAULT NULL,
  String content; // "content"	text,

  @override
  String TABLE_NAME = "Article";

  Article();

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "title": title,
      "content": content,
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  @override
  Model fromMap(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    content = map["content"];
}

  @override
  List<Model> makeModels(List<Map> maps) {
    List<Article> fData = [];
    maps.forEach((map){
      fData.add(Article().fromMap(map));
    });
    return fData;
  }
}