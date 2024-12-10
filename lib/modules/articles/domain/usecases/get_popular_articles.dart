import 'package:dartz/dartz.dart';
import 'package:ny_times/modules/articles/domain/entities/article_entity.dart';
import 'package:ny_times/modules/articles/domain/exceptions/articles_exceptions.dart';
import 'package:ny_times/modules/articles/domain/repositories/i_articles_repository.dart';

abstract class IGetPopularArticles {
  Future<Either<ArticleException, List<ArticleEntity>>> call(
      {required int interval});
}

class GetPopularArticles implements IGetPopularArticles {
  final IArticlesRepository repository;

  GetPopularArticles(this.repository);

  @override
  Future<Either<ArticleException, List<ArticleEntity>>> call(
      {required int interval}) async {
    if (![1, 7, 30].contains(interval)) {
      throw Exception('Invalid interval');
    }

    return repository.getPopularArticles(interval: interval);
  }
}
