import 'package:ny_times/modules/articles/domain/entities/article_entity.dart';
import 'package:ny_times/modules/articles/domain/repositories/i_articles_repository.dart';
import 'package:ny_times/modules/articles/infra/datasource/i_articles_datasource.dart';

class ArticlesRepository implements IArticlesRepository {
  final IArticlesDatasource dataSource;

  ArticlesRepository({required this.dataSource});

  @override
  Future<List<ArticleEntity>> getPopularArticles({
    required int interval,
  }) async {
    final response = await dataSource.getPopularArticles(interval: interval);

    return response;
  }
}
