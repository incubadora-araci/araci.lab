import 'package:araci/app/data/database/database.dart';
import 'package:araci/app/data/model/model_table.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseApi {
  static Database database;

  Future<int> insert(Model model) async {
    return database.insert(model.TABLE_NAME, model.toMap());
  }

  /// Update a Model;
  Future<int> update(Model model) async {
    return database.update(model.TABLE_NAME, model.toMap());
  }

  void close() async {
    database.close();
  }

  void printTable(String tableName) async {
    print(await database.query(tableName));
  }

  /// SELECT * FROM 'tableName';
  /// Usage:
  /// List<Model> models = database.getAll('tableName'); -> [modelx, modely, modeln, ...];
  Future<List<Model>> getAll(String fromTable, List<Model> Function(List<Map> map) makeModels,
      {String where, List<dynamic> whereArgs}) async{
    List<Map> maps = await database.query(fromTable,
        columns: ["*"],
        where: where,
        whereArgs: whereArgs
    );
    List<Model> models = List();
    models = makeModels(maps);
    return models;
  }

  /// SELECT model FROM * WHERE filterByColumn = fromValue
  /// Usage:
  /// SomeModel model = database.getFiltered(SomeModel(), 'registration', '12345678901'); -> SomeModel;
  Future<Model> getFiltered(Model model, String filterByColumn, dynamic fromValue) async{
    List<Model> models = await getAll(model.TABLE_NAME, model.makeModels);
    for(Model mdl in models){
      if(mdl.toMap()[filterByColumn] == fromValue) return mdl;
    }
    return null;
  }

  /// SELECT model FROM * WHERE fromColumns = fromValues
  /// @param: [fromTable] is the name of the table to search, examples user, userdata, etc<br>
  /// @param: [fromColumns] is the name of the key used for search, examples [id, userdata], etc<br>
  /// @param: [fromValues] is the value of the [fromColumns] key to search, examples [43, '123456789'] etc<br>
  /// Usage:
  /// Model someModel = database.getModel('tableName', ['table_id'], [42]); -> model;
  Future<Model> getModel(Model model, String fromTable, List<String> fromColumns, List<dynamic> fromValues) async{
    database.query(fromTable,
        columns: ["*"],
        where: _assembleColumnString(fromColumns),
        whereArgs: fromValues).then((maps){
      if (maps.length > 0) {
        print("carregou o model");
        return model.fromMap(maps.first);
      }
      return null;
    });
  }

  Future<List<Map<String, dynamic>>> getAllMapFormat(String tableName) async {
    return await database.query(tableName);
  }

  Future deleteAllRows(String fromTable) async{
    return await database.rawQuery("DELETE FROM $fromTable;");
  }

  Future<List<List<Map<String,dynamic>>>> smartDump() async {
    List<List<Map<String, dynamic>>> dbDump = List();
    dbDump.add(await getAllMapFormat("doencas_cronicas_pacientes"));
    dbDump.add(await getAllMapFormat("duvidas_epidemicas"));
    dbDump.add(await getAllMapFormat("pesquisas"));
    dbDump.add(await getAllMapFormat("pacientes_epidemias"));
    return dbDump;
  }

  String _assembleColumnString(List<String> columns){
    if(columns == null) return null;
    List<String> where = [];
    columns.forEach((key) => where.add('$key = ?'));
    String feedback = where.join(" AND ");
    print(feedback);
    return where.join(" AND ");
  }


//  Future<List<Map<String, dynamic>>> queryAllRows(String tableName) async {
//    Database db = await database;
//    return await db.query(tableName);
//  }
}