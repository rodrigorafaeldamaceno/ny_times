import 'package:flutter/material.dart';
import 'package:ny_times/modules/articles/domain/usecases/get_popular_articles.dart';
import 'package:ny_times/modules/articles/external/datasource/articles_datasource.dart';
import 'package:ny_times/modules/articles/infra/repositories/articles_repository.dart';
import 'package:ny_times/modules/articles/presenter/controller/article_controller.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  final controller = ArticleController(
    getPopularArticles: GetPopularArticles(
      ArticlesRepository(dataSource: ArticlesDatasource()),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NY Times'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final data = await controller.getPopularArticles(interval: 7);

            data.forEach((element) {
              print(element.title);
            });
          },
          child: const Text('Buscar'),
        ),
      ),
    );
  }
}
