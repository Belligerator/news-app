import 'package:flutter/material.dart';
import 'package:news/models/tag_dto.dart';
import 'package:news/theme/style.dart';

class Tag extends StatelessWidget {
  final TagDto tag;
  final bool? defaultSelected;
  final Function()? onTap;

  Tag({
    super.key,
    required this.tag,
    this.onTap,
    this.defaultSelected
  }) {
    if (defaultSelected != null) {
      tag.selected = defaultSelected!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Chip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          label: Text(tag.title, style: TextStyle(color: tag.selected ? Colors.white : Colors.black)),
          backgroundColor: tag.selected ? primaryColor : Colors.black12,
        ),
      ),
    );
  }
}
