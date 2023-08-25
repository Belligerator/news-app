import 'package:news/config.dart';
import 'package:news/models/tag_dto.dart';

class ArticleDto {
  final int articleContentId;
  final String title;
  final String body;
  final String articleType;
  final String? coverImage;
  final DateTime dateOfPublication;
  final List<TagDto> tags;

  ArticleDto.fromJSON(dynamic json)
      : articleContentId = json['articleContentId'],
        title = json['title'],
        body = json['body'],
        articleType = json['articleType'],
        coverImage = getCoverImage(json['coverImage']),
        dateOfPublication =
            json['dateOfPublication'] != null ? DateTime.parse(json['dateOfPublication']).toLocal() : DateTime.now(),
        tags = json['tags'] != null ? (json['tags'] as List).map((tag) => TagDto.fromJSON(tag)).toList() : [];

  /// Check if cover image contains full URL or not. If not, add base URL.
  static String? getCoverImage(String? coverImage) {
    if (coverImage == null) {
      return null;
    }

    return '$kBaseUrl/$coverImage';
  }
}
