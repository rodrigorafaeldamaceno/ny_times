import 'package:ny_times/modules/articles/domain/entities/article_entity.dart';

abstract class IArticlesDatasource {
  Future<List<ArticleEntity>> getPopularArticles({required int interval});
}
