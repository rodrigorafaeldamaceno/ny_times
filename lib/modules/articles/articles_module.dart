import 'package:flutter_modular/flutter_modular.dart';
import 'package:ny_times/modules/articles/domain/repositories/i_articles_repository.dart';
import 'package:ny_times/modules/articles/domain/usecases/get_popular_articles.dart';
import 'package:ny_times/modules/articles/external/datasource/articles_datasource.dart';
import 'package:ny_times/modules/articles/infra/datasource/i_articles_datasource.dart';
import 'package:ny_times/modules/articles/infra/repositories/articles_repository.dart';
import 'package:ny_times/modules/articles/presenter/controller/article_controller.dart';
import 'package:ny_times/modules/articles/presenter/pages/articles_page.dart';

class ArticlesModule extends Module {
  @override
  void binds(i) {
    i.add<IArticlesDatasource>(ArticlesDatasource.new);
    i.add<IArticlesRepository>(ArticlesRepository.new);
    i.add<IGetPopularArticles>(GetPopularArticles.new);

    i.addLazySingleton(ArticleController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const ArticlesPage());
  }
}
