import 'package:flutter/material.dart';
import 'package:news/locator.dart';
import 'package:news/services/navigation_service.dart';
import 'package:news/theme/style.dart';
import 'package:news/theme/ui_helpers.dart';

class Utils {

  /// Show a snackbar with the given [body] and [title] (optional).
  static void showSnackBar({required String body, String? title, Duration duration = const Duration(seconds: 5)}) {
    BuildContext? context = locator<NavigationService>().navigatorKey.currentContext;
    if (context != null) {
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: duration,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
                visible: title != null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title ?? '', style: segmentText),
                    UIHelper.verticalSpaceSmall(),
                  ],
                )),
            Text(body, maxLines: 5, overflow: TextOverflow.ellipsis),
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
