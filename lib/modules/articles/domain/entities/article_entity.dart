import 'package:ny_times/core/domain/extensions/datetime.dart';

class ArticleEntity {
  final String title;
  final String description;
  final String? imageUrl;
  final DateTime createdAt;

  String? get formattedDate => createdAt.formatted();

  ArticleEntity({
    required this.title,
    required this.description,
    required this.createdAt,
    this.imageUrl,
  });
}
