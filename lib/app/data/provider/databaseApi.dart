import 'dart:async';

import 'package:araci/app/data/database/const.dart';
import 'package:araci/app/data/model/model_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseApi {
  String path;
  static Database database;
  List<Map<String ,dynamic>> articleMap = [{"id": 1,"title":"**Cosme Corrêa**","body":"**Cosme** Nasceu em Volta Redonda e Jogava ~~Atari~~.","videoURL":null, "imgPath":"assets/testImages/CosmeCoffee.png","imgURL":null, "externalURL":null,"related":[2,3]},
    {"id": 2,"title":"**Volta Redonda**","body":"É uma linda cidade onde nasceu o ~~Cosme~~","videoURL":null, "imgPath":null,"imgURL":null,"externalURL":"https://pt.wikipedia.org/wiki/Volta_Redonda","related":[1]},
    {"id": 3,"title":"**Atari**","body":"Foi um Video game muito popular em ~~Volta Redonda~~","videoURL":"https://www.youtube.com/watch?v=txuTq1AD1hU", "imgPath":null,"imgURL":null,"externalURL":null,"related":[2]}
  ];

  Future<DatabaseApi> init() async {
    var databasePath = await getDatabasesPath();
    this.path = join(databasePath, DATABASE_NAME);
    return open();
  }

  /// Opens the .db file and creates the tables, if needed.
  Future<DatabaseApi> open() async {
    database = await openDatabase(path, version: VERSION,
        onCreate: (Database db, int version) {
          TABLES_MODELS.forEach((query) async => await db.execute(query));
        },
        onUpgrade: (Database db, int oldVersion, int newVersion) {
          // When upgrading the db, run upgrade code
          for (oldVersion++; oldVersion <= newVersion; oldVersion++) {
            TABLES_MODELS_UPDATES["$oldVersion"].forEach((query) {
              db.execute(query);
            });
          }
        }
    );
    return this;
  }

  FutureOr<Map<String, dynamic>> findArticleById(int id){
    for (Map<String, dynamic> map in articleMap) {
      if(map["id"] == id) {
        // print("Titulo dentro do databaseApi::::: ${map["title"]}");
        return map;
      }
    }
    return null;
  }

  FutureOr<List<Map<String, dynamic>>> getAllArticles(){
    return articleMap;
  }

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

  // Future<List<List<Map<String,dynamic>>>> smartDump() async {
  //   List<List<Map<String, dynamic>>> dbDump = List();
  //   dbDump.add(await getAllMapFormat("doencas_cronicas_pacientes"));
  //   dbDump.add(await getAllMapFormat("duvidas_epidemicas"));
  //   dbDump.add(await getAllMapFormat("pesquisas"));
  //   dbDump.add(await getAllMapFormat("pacientes_epidemias"));
  //   return dbDump;
  // }

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