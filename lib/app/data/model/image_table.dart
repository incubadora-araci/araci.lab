import 'package:araci/app/data/model/model_table.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

class Image extends Model{
  int id; // PK "image"	integer NOT NULL,
  Blob file;// "file"	blob,
  int articleId;

  @override
  String TABLE_NAME = "Image";

  Image();

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "file": file,
      "article_id": articleId
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  @override
  Model fromMap(Map<String, dynamic> map) {
    id = map["id"];
    file = map["file"];
    articleId = map["article_id"];
  }

  @override
  List<Model> makeModels(List<Map> maps) {
    List<Image> fData = [];
    maps.forEach((map){
      fData.add(Image().fromMap(map));
    });
    return fData;
  }
}