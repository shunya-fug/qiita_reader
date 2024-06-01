import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qiita_reader/main.dart';
import 'package:qiita_reader/pages/article_list/providers/visible_search_bar_provider.dart';

/// 検索バーの表示・非表示を制御するスクロールコントローラーを提供するプロバイダー
final scrollControllerProvider = Provider.autoDispose((ref) {
  final scrollController = ScrollController();
  scrollController.addListener(() {
    final isVisible = ref.read(visibleSearchBarProvider.notifier).state;
    switch (scrollController.position.userScrollDirection) {
      // 表示
      case ScrollDirection.forward:
        if (!isVisible) {
          logger.i('検索バー表示');
          ref.read(visibleSearchBarProvider.notifier).state = true;
        }
        break;
      // 非表示
      case ScrollDirection.reverse:
        if (isVisible) {
          logger.i('検索バー非表示');
          ref.read(visibleSearchBarProvider.notifier).state = false;
        }
        break;
      case ScrollDirection.idle:
        break;
    }
  });
  return scrollController;
});
