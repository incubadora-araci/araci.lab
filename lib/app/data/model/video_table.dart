import 'package:araci/app/data/model/model_table.dart';

class Video extends Model{
  int id;
  String url;
  String title;
  int articleId;

  @override
  String TABLE_NAME = "Video";

  Video();

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "url": url,
      "title": title,
      "article_id": articleId
    };
    if (id != null) {
      map["video"] = id;
    }
    return map;
  }

  @override
  Model fromMap(Map<String, dynamic> map) {
    id = map["id"];
    url = map["url"];
    title = map["title"];
    articleId = map["article_id"];
  }

  @override
  List<Model> makeModels(List<Map> maps) {
    List<Video> fData = [];
    maps.forEach((map){
      fData.add(Video().fromMap(map));
    });
    return fData;
  }
}