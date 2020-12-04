import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:meta/meta.dart';

class ArticleRepository {
  final DatabaseApi databaseApi;

  ArticleRepository({@required this.databaseApi}) : assert(databaseApi != null);

  findArticleById(int id){
    return databaseApi.findArticleById(id);
  }

  getAllArticles(){
    return databaseApi.getAllArticles();
  }
  // Future<List<String>> updateVidsList() async {
  //   return ["https://www.youtube.com/watch?v=xqr9gV5E2Lg","https://www.youtube.com/watch?v=KxVb9Lcvry4","https://www.youtube.com/watch?v=EMru3oqZ66U","https://www.youtube.com/watch?v=eh2GCow3NY8","https://www.youtube.com/watch?v=iLprfJV41W4"];
  // }


//TODO: implement get methods
}

