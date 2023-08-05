class TagDto {
  final String id;
  final String language;
  final String title;
  final int order;
  bool selected = false;

  TagDto.fromJSON(dynamic json)
      : id = json['id'],
        language = json['language'],
        title = json['title'],
        order = json['order'];

}
