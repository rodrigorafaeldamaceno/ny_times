import 'package:dio/dio.dart';
import 'package:ny_times/modules/articles/domain/entities/article_entity.dart';
import 'package:ny_times/modules/articles/external/mappers/article_mapper.dart';
import 'package:ny_times/modules/articles/infra/datasource/i_articles_datasource.dart';

class ArticlesDatasource implements IArticlesDatasource {
  final Dio dio = Dio();

  @override
  Future<List<ArticleEntity>> getPopularArticles({
    required int interval,
  }) async {
    final response = await dio.get(
      'https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/$interval.json',
      queryParameters: {
        'api-key': const String.fromEnvironment('API_KEY'),
      },
      options: Options(
        headers: {
          'User-Agent': 'insomnia/10.2.0',
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data['results'] as List;

      final articles = data.map((e) => ArticleMapper.fromMap(e)).toList();

      return articles;
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
