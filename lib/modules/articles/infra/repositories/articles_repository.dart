import 'package:dartz/dartz.dart';
import 'package:ny_times/modules/articles/domain/entities/article_entity.dart';
import 'package:ny_times/modules/articles/domain/repositories/i_articles_repository.dart';
import 'package:ny_times/modules/articles/infra/datasource/i_articles_datasource.dart';

import '../../domain/exceptions/articles_exceptions.dart';

class ArticlesRepository implements IArticlesRepository {
  final IArticlesDatasource dataSource;

  ArticlesRepository({required this.dataSource});

  @override
  Future<Either<ArticleException, List<ArticleEntity>>> getPopularArticles({
    required int interval,
  }) async {
    try {
      final response = await dataSource.getPopularArticles(interval: interval);

      return Right(response);
    } on ArticleException catch (e) {
      return Left(e);
    }
  }
}
