import 'package:flutter/material.dart';
import 'package:news/models/tag_dto.dart';
import 'package:news/widgets/tag.dart';

class TagBar extends StatelessWidget implements PreferredSizeWidget {

  final List<TagDto> tags;
  final Function(TagDto tag) onTagSelected;

  const TagBar({super.key, required this.tags, required this.onTagSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: 50,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (final tag in tags)
              Tag(
                tag: tag,
                onTap: () => onTagSelected(tag),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
