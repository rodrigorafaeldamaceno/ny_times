import 'package:flutter/foundation.dart';
import 'package:ny_times/modules/articles/domain/entities/article_entity.dart';
import 'package:ny_times/modules/articles/domain/usecases/get_popular_articles.dart';

class ArticleController extends ChangeNotifier {
  final IGetPopularArticles _getPopularArticles;

  ArticleController({required IGetPopularArticles getPopularArticles})
      : _getPopularArticles = getPopularArticles;

  final List<ArticleEntity> articles = [];

  Future<void> getPopularArticles({
    required int interval,
  }) async {
    final data = await _getPopularArticles(interval: interval);

    articles.clear();
    articles.addAll(data);

    notifyListeners();
  }
}
