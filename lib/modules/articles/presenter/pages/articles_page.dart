import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ny_times/modules/articles/domain/entities/article_entity.dart';
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
  final controller = Modular.get<ArticleController>();

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future fetchArticles() async {
    await controller.getPopularArticles(interval: 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NY Times'),
      ),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, widget) {
          return ListView.builder(
            itemCount: controller.articles.length,
            itemBuilder: (BuildContext context, int index) {
              final article = controller.articles[index];

              return ListTile(
                leading: article.imageUrl != null
                    ? Image.network(article.imageUrl!)
                    : const Icon(Icons.image),
                title: Text(article.title),
              );
            },
          );
        },
      ),
    );
  }
}
