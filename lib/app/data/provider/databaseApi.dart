import 'dart:async';

import 'package:araci/app/data/database/const.dart';
import 'package:araci/app/data/model/model_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseApi {
  String path;
  static Database database;
  List<Map<String ,dynamic>> articleMap =
  [{"id": 2,"title":"**Documentário e história**","body":"Coube ao historiador francês [Marc Ferro](https://revistas.ufpr.br/historia/article/view/2713) de incluir definitivamente o filme como um documento passível de ser uma fonte para o estudo da história. Para ele, “o filme deve ser associado ao mundo que o produz. A hipótese? Que o filme, imagem ou não da realidade, documento ou ficção, intriga autêntica ou pura invenção, é História; o postulado? Que o que não aconteceu (e por que não, também o que aconteceu), as crenças, as intenções, o imaginário do homem, são tão História quanto a História”. Com esta possibilidade, abriu-se a perspectiva não apenas de obras que davam pistas sobre o passado da humanidade, mas também obras reflexivas que revisitam momentos históricos através de imagens de arquivo, depoimentos e outros recursos audiovisuais.","videoURL":null, "imgPath":null,"imgURL":null, "externalURL":null,"related":[4]},
    {"id": 1,"title":"**Silvio Tendler**","body":"Silvio Tendler (Rio de Janeiro, 1950) Seus filmes mais conhecidos são [Os anos JK - Uma trajetória política](https://www.youtube.com/watch?v=Qe6RGrCE2fc) (1980) e  [Jango](https://www.youtube.com/watch?v=52lBqoB-OcQ) (1984). Ambos foram produzidos durante a abertura política no Brasil. Considerados na fronteira entre **documentário**, **história** e política, os dois títulos traçaram o retrato de dois presidentes eleitos pelo voto popular e buscaram rememorar o cenário democrático do Brasil pré-ditadura militar. Tendler tem mais de 80 trabalhos audiovisuais entre longas e curtas-metragens, séries, programas para a TV e a internet, e vídeos-instalações. Além do tom político, outras marcas da obra do diretor são o registro de **depoimentos** e o uso de material de arquivo. Seu mais recente trabalho é Nas asas da Pam Am (2020) um filme-ensaio que conta a história do próprio autor narrado na primeira pessoa.","videoURL":null, "imgPath":"assets/images/FotoSilvioTendler.jpg","imgURL":null,"externalURL":null,"related":[2,3]},
    {"id": 3,"title":"**Depoimento**","body":" É bastante frequente nos documentários o uso de testemunho de pessoas que tenham relação direta ou indireta com o tema abordado. Trata-se de um recurso que registra muitas vezes tanto imagem como som do entrevistado e deve-se implementar uma boa pesquisa que traga pontos importantes e originais sobre o personagem e o assunto do filme. Em geral, é preciso construir uma relação de confiança entre entrevistado e entrevistador para que as informações fornecidas na gravação tenham clareza e possam ser articuladas na montagem do filme auxiliando no seu aspecto discursivo e narrativo.","videoURL":null, "imgPath":null,"imgURL":null,"externalURL":null,"related":[4]},
    {"id": 4,"title":"**A Problemática da Entrevista e do Depoimento no Documentário Brasileiro Contemporâneo**","body":"Link para o documento abaixo em Relacionados","externalURL":"http://www.portcom.intercom.org.br/pdfs/151759236119685720944875553590913296104.pdf","videoURL":null,"imgPath":null,"imgURL":null,"related":null}
    ];

  Future<DatabaseApi> init() async {
    var databasePath = await getDatabasesPath();
    this.path = join(databasePath, DATABASE_NAME);
    print("INITIALIZING DB @@@");
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
    print("FINISHED OPENING DB");
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