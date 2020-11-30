/// Generic class to use as base to build other tables
///
/// @author Lucas Lopes
/// @since 23/11/2020
/// @version 20201123

abstract class Model{
  String TABLE_NAME;

  Map<String, dynamic> toMap(){}
  Model fromMap(Map<String, dynamic> map){}
  List<Model> makeModels(List<Map> maps);
}