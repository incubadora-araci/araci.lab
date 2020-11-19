class ApiModel {

  int id;
  String name;

  ApiModel({ this.id, this.name });

  ApiModel.fromJson(Map<String, dynamic> json){
      this.id = json['id'];
      this.name = json['name'];
  }

  Map<String, dynamic> toJson() => {'id':id, 'name':name };
}