import 'model_table.dart';

class ArticleModel extends Model {

  int id;
  String title;
  String body;
  String externalUrl;
  String imgUrl;
  String relatedIds;

  ArticleModel({ this.id, this.title, this.body, this.externalUrl, this.imgUrl, this.relatedIds });

  @override
  String TABLE_NAME = "Article";

  @override
  ArticleModel.fromJson(Map<String, dynamic> json){
      this.id = json['id'];
      this.title = json['name'];
      this.body = json['body'];
      this.externalUrl = json['externalUrl'];
      this.imgUrl = json['imgUrl'];
      this.relatedIds = json['relatedIds'];
  }

  @override
  Map<String, dynamic> toMap() => {
    'id':id,
    'title':title,
    'body':body,
    'externalUrl':externalUrl,
    'imgUrl': imgUrl,
    'relatedIds':relatedIds

  };

  @override
  List<Model> makeModels(List<Map> maps) {
    List<ArticleModel> aData = [];
    maps.forEach((element) {
      aData.add(ArticleModel().fromMap(element));
    });
    return aData;
  }
}