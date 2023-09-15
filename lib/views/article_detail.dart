import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/models/article_dto.dart';
import 'package:news/theme/style.dart';
import 'package:news/theme/ui_helpers.dart';
import 'package:news/widgets/tag.dart';

class ArticleDetail extends StatelessWidget {
  final ArticleDto article;

  const ArticleDetail({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Best news'),
      ),
      body: SingleChildScrollView(
        padding: paddingMainView,
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  DateFormat('dd.MM.yyyy').format(article.dateOfPublication),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Wrap(
                  children: [
                    for (var tag in article.tags)
                      Tag(tag: tag, defaultSelected: true),
                  ],
                ),
                UIHelper.verticalSpaceSmall(),
                Visibility(
                  visible: article.coverImage != null && article.coverImage!.isNotEmpty,
                  child: Image.network(article.coverImage ?? ''),
                ),
                UIHelper.verticalSpaceSmall(),
                Text(article.body),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
