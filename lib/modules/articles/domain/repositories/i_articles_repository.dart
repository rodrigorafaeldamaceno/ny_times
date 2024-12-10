import 'package:dartz/dartz.dart';
import 'package:ny_times/modules/articles/domain/entities/article_entity.dart';

import '../exceptions/articles_exceptions.dart';

abstract class IArticlesRepository {
  Future<Either<ArticleException, List<ArticleEntity>>> getPopularArticles(
      {required int interval});
}
