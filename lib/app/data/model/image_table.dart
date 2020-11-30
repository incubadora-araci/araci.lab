import 'package:araci/app/data/model/model_table.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

class Image extends Model{
  int image; // PK "image"	integer NOT NULL,
  Blob file;// "file"	blob,
  int nodeId;

  @override
  String TABLE_NAME = "Image";

  Image();

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "file": file,
      "node_id": nodeId
    };
    if (image != null) {
      map["image"] = image;
    }
    return map;
  }

  @override
  Model fromMap(Map<String, dynamic> map) {
    image = map["image"];
    file = map["file"];
    nodeId = map["node_id"];
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