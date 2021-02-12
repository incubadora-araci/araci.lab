class ArticleModel {

  int id;
  String title;
  String body;
  String externalUrl;
  String imgUrl;
  String relatedIds;

  ArticleModel({ this.id, this.title, this.body, this.externalUrl, this.imgUrl, this.relatedIds });

  ArticleModel.fromJson(Map<String, dynamic> json){
      this.id = json['id'];
      this.title = json['name'];
      this.body = json['body'];
      this.externalUrl = json['externalUrl'];
      this.imgUrl = json['imgUrl'];
      this.relatedIds = json['relatedIds'];
  }

  Map<String, dynamic> toJson() => {
    'id':id,
    'title':title,
    'body':body,
    'externalUrl':externalUrl,
    'imgUrl': imgUrl,
    'relatedIds':relatedIds

  };
}