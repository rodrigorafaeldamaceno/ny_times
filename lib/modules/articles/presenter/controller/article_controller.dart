import 'package:ny_times/modules/articles/domain/entities/article_entity.dart';
import 'package:ny_times/modules/articles/domain/usecases/get_popular_articles.dart';

class ArticleController {
  final IGetPopularArticles _getPopularArticles;

  ArticleController({required IGetPopularArticles getPopularArticles})
      : _getPopularArticles = getPopularArticles;

  Future<List<ArticleEntity>> getPopularArticles({
    required int interval,
  }) async {
    final data = await _getPopularArticles(interval: interval);

    return data;
  }
}
