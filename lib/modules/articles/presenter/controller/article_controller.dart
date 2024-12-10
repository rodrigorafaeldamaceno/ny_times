import 'package:flutter/foundation.dart';
import 'package:ny_times/modules/articles/domain/entities/article_entity.dart';
import 'package:ny_times/modules/articles/domain/usecases/get_popular_articles.dart';

import 'package:mobx/mobx.dart';

part 'article_controller.g.dart';

class ArticleController = _ArticleControllerBase with _$ArticleController;

abstract class _ArticleControllerBase with Store {
  final IGetPopularArticles _getPopularArticles;

  _ArticleControllerBase({
    required IGetPopularArticles getPopularArticles,
  }) : _getPopularArticles = getPopularArticles;

  @observable
  ObservableList<ArticleEntity> articles = ObservableList<ArticleEntity>();

  @action
  Future<void> getPopularArticles({
    required int interval,
  }) async {
    final response = await _getPopularArticles(interval: interval);

    response.fold(
      (error) {
        print(error);
      },
      (success) {
        articles.clear();
        articles.addAll(success);
      },
    );
  }

  @action
  void sortArticles(bool isDesc) {
    articles.sort((a, b) {
      if (isDesc) {
        return b.createdAt.compareTo(a.createdAt);
      } else {
        return a.createdAt.compareTo(b.createdAt);
      }
    });
  }
}
