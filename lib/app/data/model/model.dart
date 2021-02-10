class ArticleModel {

  int id;
  String title;
  String body;
  String externalUrl;
  String img;
  String imgPath;
  String relatedIds;

  ArticleModel({ this.id, this.title, this.body, this.externalUrl, this.img, this.imgPath, this.relatedIds });

  ArticleModel.fromJson(Map<String, dynamic> json){
      this.id = json['id'];
      this.title = json['name'];
      this.body = json['body'];
      this.externalUrl = json['externalUrl'];
      this.img = json['img'];
      this.imgPath = json['imgPath'];
      this.relatedIds = json['relatedIds'];
  }

  Map<String, dynamic> toJson() => {
    'id':id,
    'title':title,
    'body':body,
    'externalUrl':externalUrl,
    'img': img,
    'imgPath': imgPath,
    'relatedIds':relatedIds

  };
}