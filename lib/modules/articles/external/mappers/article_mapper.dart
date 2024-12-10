import 'package:ny_times/modules/articles/domain/entities/article_entity.dart';

class ArticleMapper extends ArticleEntity {
  ArticleMapper({
    required super.title,
    required super.description,
    required super.createdAt,
    super.imageUrl,
  });

  factory ArticleMapper.fromMap(Map<String, dynamic> map) {
    String? imageUrl;

    if (map['media'] != null && (map['media'] as List).isNotEmpty) {
      imageUrl = (map['media'] as List)
          .firstWhere((media) => media['type'] == 'image')['media-metadata']
          .first['url'];
    }

    return ArticleMapper(
      title: map['title'],
      description: map['abstract'],
      createdAt: DateTime.parse(map['published_date']),
      imageUrl: imageUrl,
    );
  }
}
