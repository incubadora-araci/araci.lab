import 'package:araci/app/data/model/model_table.dart';

class Video extends Model{
  int video;
  String url;
  String title;
  int nodeId;

  @override
  String TABLE_NAME = "Video";

  Video();

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "url": url,
      "title": title,
      "node_id": nodeId
    };
    if (video != null) {
      map["video"] = video;
    }
    return map;
  }

  @override
  Model fromMap(Map<String, dynamic> map) {
    video = map["video"];
    url = map["url"];
    title = map["title"];
    nodeId = map["node_id"];
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