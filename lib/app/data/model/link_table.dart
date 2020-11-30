import 'package:araci/app/data/model/model_table.dart';

class Link extends Model{
  int id;
  String url;
  int articleId;

  @override
  String TABLE_NAME = "Link";

  Link();

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "url": url,
      "node_id": articleId
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  @override
  Model fromMap(Map<String, dynamic> map) {
    id = map["id"];
    url = map["url"];
    articleId = map["article_id"];
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